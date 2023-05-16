# Changelog

## (unreleased)

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
