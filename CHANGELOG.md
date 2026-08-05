# Changelog

## Unreleased

### Changed

* The generated OpenAPI client now lives in its own internal `RaiderIOAPI` target;
  `RaiderIO`'s hand-written models are constructed directly from its typed responses
  instead of independently re-parsing raw JSON. `RaiderIO` no longer needs to import
  `OpenAPIRuntime` except where it builds the network client itself.
* Request failures from the generated client now surface as `RaiderIOError.http(statusCode:)`
  rather than the richer `RaiderIOError.server(statusCode:error:message:)` - getting the
  exact server-provided error message would require re-parsing the raw response body, which
  this change moves away from. `RaiderIOError.server` is still used by the one endpoint
  (`search`) that isn't covered by the generated client.
* Fixed several inaccuracies in RaiderIO's vendored OpenAPI spec that surfaced during this
  migration (see `upgrade-openapi-definition.sh`): a handful of numeric fields typed
  `integer` that the live API actually returns as fractional numbers (`artifactTraits`,
  `itemLevelEquipped`/`itemLevelTotal`), `corruption.spells` typed as strings when it's
  actually full spell objects, and `RaidProgression.expansion_id` marked required when at
  least one raid omits it. Also typed the previously-untyped equipped-gear ("items") object.

### Removed

* `Profile.guild`, `.covenant`, `.mythicPlusHighestLevelRuns`, `.mythicPlusWeeklyHighestLevelRuns`,
  `.mythicPlusPreviousWeeklyHighestLevelRuns`, `.raidAchievementMeta`, `.raidAchievementCurve`,
  and the matching `ProfileField` request options - none of these are modeled by RaiderIO's
  OpenAPI response schema, so they could only ever decode to `nil`.
* `Character.personaId`, `.covenant`, `.talents`, `.talentsDetails`, and equipped-item
  `.corruption`/domination shards/azerite powers - same reason (unbacked by the schema, and
  the underlying WoW mechanics are long-retired Battle for Azeroth/Shadowlands-era systems).
* `RaidRanking.streamers`/`.recruitmentProfiles` - never actually backed by the raid-rankings
  response schema.

## 0.8.0

### Changed

* Using Swagger API definition file for generating the client now. A few endpoints are still undocumented.
* Update raid slugs for Dragonflight and The War Within.
* Update to Swift 6.2.
* Requires macOS 26, iOS 26, and alike.

## 0.7.2

### Changed

* Using swift-testing for unit tests

### Fixes

* Updates to make it work with current raider.io API.

## 0.7.1

### Fixed

* LoggingSources properties support profiles as well as characters.

## 0.7.0

### Added

* Add undocumented API call for more information about dungeon runs.

### Fixed

* Characters without guilds work.

## 0.6.1

### Fixed

* Support parsing url strings with non-allowed characters.

## 0.6.0

### Added

* Evoker class, Vault of Incarnates and talent loadouts.
* Support for Battle for Azeroth and Legion boss kills.

## 0.5.0

### Added

* Mythic+ rating calculations
* Custom type for mythic+ scores

## 0.4.0

### Added

* Allow configurability of base URL. The default remains at "https://raider.io/api".
* Expanded subtypes for BossKill type.
* Use custom Millisecond type.
* Added a ClassSlug type.
* Add Dragonflight expansion value.

### Fixed

* Make streamers and recruitmentProfiles on RaidRanking optional.

## 0.3.0

### Added

* Added search endpoint.
* Make slug types equatable with their rawValue.

### Fixed

* Fixed raidProgression field definition for profile.
* Added missing public modifiers for Gear.

## 0.2.0

### Changed

* Change library name to "RaiderIO".
* Added public constructors for types.
* Added documentation from Swagger to Swift types.
* Use raw value represented types for enums that frequently change over time.

### Fixed

* Added missing public modifiers.

## 0.1.0

### Added

* Support all endpoints listed on [Raider.IO API website](https://raider.io/api).
  * Implementations might overlap and are done on the basis of the Swagger model descriptions and actual responses.
