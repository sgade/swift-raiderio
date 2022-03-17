# Changelog

## (unreleased)

### Added

* Expanded subtypes for BossKill type.
* Use custom Millisecond type.

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
