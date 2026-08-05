#!/bin/bash

set -euo pipefail

OUTPUT="Sources/RaiderIOAPI/openapi.json"
# RaiderIO provides an OpenAPI v3 specification, separately from https://raider.io/api
SOURCE='https://raider.io/openapi.json'

RAW=$(mktemp)
trap 'rm -f "$RAW" "$RAW.step1" "$RAW.step2" "$RAW.step3" "$RAW.step4" "$RAW.step5"' EXIT

curl \
    -X 'GET' \
    -H 'accept: application/json' \
    "$SOURCE" > "$RAW"

# RaiderIO's spec stashes a couple of schema fragments under a non-standard
# top-level "x-alt-definitions" key instead of "components/schemas", and
# references them via "$ref": "#/x-alt-definitions/...". That's not a
# location OpenAPI tooling resolves references into (refs are expected to
# point at components/*), which makes swift-openapi-generator fail with:
#   "JSONSchema reference points to this document and can be found in
#   components/schemas"
# Rewrite those refs to point at components/schemas instead, promoting the
# "bossKillVideo" fragment to a proper named schema in the process, then
# drop the now-unused x-alt-definitions key.
jq '
  (.["x-alt-definitions"]["bossKillVideo"]
    | walk(if type == "object" and has("$ref") and .["$ref"] == "#/x-alt-definitions/Video"
           then .["$ref"] = "#/components/schemas/Video"
           else . end)
  ) as $bossKillVideo
  | .components.schemas.BossKillVideo = $bossKillVideo
  | walk(if type == "object" and has("$ref") and .["$ref"] == "#/x-alt-definitions/Video"
         then .["$ref"] = "#/components/schemas/Video"
         else . end)
  | walk(if type == "object" and has("$ref") and .["$ref"] == "#/x-alt-definitions/bossKillVideo"
         then .["$ref"] = "#/components/schemas/BossKillVideo"
         else . end)
  | del(.["x-alt-definitions"])
' "$RAW" > "$RAW.step1"

# RaiderIO's spec also declares several pairs of schemas whose names differ
# only by case/separators (e.g. "Region" vs "region", "RaidEncounter" vs
# "raidEncounter") - genuinely different schemas, but our
# `namingStrategy: idiomatic` (see openapi-generator-config.yaml) collapses
# both to the same Swift identifier, crashing generation with:
#   "Fatal error: Duplicate values for key: '...'"
# Rename the second schema in each colliding pair to something unambiguous.
# NB: if RaiderIO introduces new colliding pairs, generation will fail the
# same way and this map will need a new entry.
RENAMES='{
  "region": "RegionScope",
  "keystoneRun": "KeystoneRunDetail",
  "raidRankings": "RaidRankingEntries",
  "loggedDetails": "RaidEncounterLoggedDetails",
  "guildPrivacy": "GuildSharePrivacy",
  "raidEncounter": "RaidEncounterDetail",
  "mythic_plus_scores_by_season": "MythicPlusScoresBySeasonList"
}'

jq --argjson renames "$RENAMES" '
  reduce ($renames | to_entries[]) as $e (
    .;
    .components.schemas[$e.value] = .components.schemas[$e.key]
    | del(.components.schemas[$e.key])
    | walk(
        if type == "object" and has("$ref") and .["$ref"] == ("#/components/schemas/" + $e.key)
        then .["$ref"] = "#/components/schemas/" + $e.value
        else . end
      )
  )
' "$RAW.step1" > "$RAW.step2"
rm -f "$RAW.step1"

# RaiderIO's spec declares a character's equipped gear ("items") as a bare,
# propertyless `{"type": "object"}` - i.e. undocumented/untyped, even though the
# live API actually returns a real object keyed by gear slot. Without a shape here,
# swift-openapi-generator can't produce anything but an opaque container, so there's
# nothing to construct RaiderIO's public `Character.Items.Equipment` model from.
# Type it explicitly (one property per gear slot, each a new "EquippedItem" schema)
# using RaiderIO's existing hand-written Item shape as source of truth (minus
# corruption/domination shards/azerite powers - Battle for Azeroth/Shadowlands-era mechanics,
# unbacked by this spec either way, long vestigial, and (azerite_powers specifically) prone to
# containing `null` entries the generator can't model cleanly through an "allOf"-wrapped
# nullable array item).
jq '
  .components.schemas.EquippedItem = {
    "type": "object",
    "required": ["item_id", "item_level", "icon", "name", "item_quality", "is_legendary", "gems", "bonuses"],
    "properties": {
      "item_id": { "type": "integer" },
      "item_level": { "type": "integer" },
      "icon": { "type": "string" },
      "name": { "type": "string" },
      "item_quality": { "type": "integer" },
      "is_legendary": { "type": "boolean" },
      "tier": { "type": "string", "nullable": true },
      "gems": { "type": "array", "items": { "type": "integer" } },
      "bonuses": { "type": "array", "items": { "type": "integer" } }
    }
  }
  | .components.schemas.items = {
    "type": "object",
    "description": "Map of slot name to equipped item",
    "properties": (
      ["head", "neck", "shoulder", "back", "chest", "waist", "wrist", "hands", "legs",
       "feet", "finger1", "finger2", "trinket1", "trinket2", "mainhand", "offhand"]
      | map({ (.): { "$ref": "#/components/schemas/EquippedItem" } })
      | add
    )
  }
' "$RAW.step2" > "$RAW.step3"
rm -f "$RAW.step2"

# Several character/item schemas type these fields as "integer", but the live API sends
# fractional values for them in practice (e.g. "artifactTraits": 80.80761425192645,
# "item_level_equipped": 411.562) - confirmed by swift-openapi-generator/-runtime rejecting real
# responses with "Number ... is not representable in Swift". Sibling schemas for the same concept
# (CharacterGear.artifact_traits, gear.artifact_traits) already correctly say "number"; fix the
# mistyped ones to match.
MISTYPED_INTEGER_FIELDS='["artifactTraits", "artifact_traits", "itemLevelEquipped", "item_level_equipped", "itemLevelTotal", "item_level_total"]'
jq --argjson fields "$MISTYPED_INTEGER_FIELDS" '
  .components.schemas |= with_entries(
    .value.properties |= (
      if . == null then .
      else reduce ($fields[]) as $field (
        .;
        if has($field) and .[$field].type == "integer" then .[$field].type = "number" else . end
      )
      end
    )
  )
' "$RAW.step3" > "$RAW.step4"
rm -f "$RAW.step3"

# `corruption.spells` claims to be an array of strings, but the live API actually sends full
# spell objects there (matching the "Spell" schema) - confirmed by swift-openapi-runtime
# rejecting real boss-kill responses with "Expected to decode String but found a dictionary".
# We don't consume this (Battle for Azeroth-era corruption data isn't exposed by RaiderIO's
# hand-written models), but a wrong type here still blocks decoding the whole parent object.
jq '
  .components.schemas.spells.items = { "$ref": "#/components/schemas/Spell" }
' "$RAW.step4" > "$RAW.step5"
rm -f "$RAW.step4"

# `RaidProgression.expansion_id` is marked required, but the live API omits it for at least one
# raid ("the-tidebound-grotto", not yet a real released raid - looks like placeholder/upcoming
# data) - confirmed by swift-openapi-runtime rejecting real guild-profile responses with
# "keyNotFound ... expansion_id". Not required in practice; relax the schema to match.
jq '
  .components.schemas.RaidProgression.required -= ["expansion_id"]
' "$RAW.step5" > "$OUTPUT"
rm -f "$RAW.step5"
