#!/bin/bash

set -euo pipefail

OUTPUT="Sources/RaiderIOAPI/openapi.json"
# RaiderIO provides an OpenAPI v3 specification, separately from https://raider.io/api
SOURCE='https://raider.io/openapi.json'

RAW=$(mktemp)
trap 'rm -f "$RAW" "$RAW.step1"' EXIT

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
' "$RAW.step1" > "$OUTPUT"
rm -f "$RAW.step1"
