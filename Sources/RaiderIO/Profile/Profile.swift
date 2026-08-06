//
//  Profile.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation

public struct Profile {

    public struct Gear {

        private enum CodingKeys: String, CodingKey {

            case itemLevelEquipped = "item_level_equipped"
            case itemLevelTotal = "item_level_total"
            case artifactTraits = "artifact_traits"

        }

        public let itemLevelEquipped: Float
        public let itemLevelTotal: Float?
        public let artifactTraits: Float

        public init(
            itemLevelEquipped: Float,
            itemLevelTotal: Float?,
            artifactTraits: Float
        ) {
            self.itemLevelEquipped = itemLevelEquipped
            self.itemLevelTotal = itemLevelTotal
            self.artifactTraits = artifactTraits
        }

    }

    public let name: String
    public let race: String
    public let `class`: String
    public let activeSpecName: String
    public let activeSpecRole: Role
    public let gender: Gender
    public let faction: Faction
    public let region: RegionSlug
    public let realm: String
    public let profileUrl: URL
    public let profileBanner: String
    public let achievementPoints: Int
    public let thumbnailUrl: URL
    public let lastCrawledAt: ISO8601Date

    public let gear: Gear?

    public let raidProgression: [String: RaidProgression]?

    public let mythicPlusScoresBySeason: [SeasonScores]?
    public let mythicPlusRanks: [String: Ranks]?
    public let mythicPlusRecentRuns: [DungeonRun]?
    public let mythicPlusBestRuns: [DungeonRun]?
    public let mythicPlusAlternateRuns: [DungeonRun]?
    public let previousMythicPlusRanks: [String: Ranks]?

    public init(
        name: String,
        race: String,
        `class`: String,
        activeSpecName: String,
        activeSpecRole: Role,
        gender: Gender,
        faction: Faction,
        region: RegionSlug,
        realm: String,
        profileUrl: URL,
        profileBanner: String,
        achievementPoints: Int,
        thumbnailUrl: URL,
        lastCrawledAt: ISO8601Date,
        gear: Gear? = nil,
        raidProgression: [String: RaidProgression]? = nil,
        mythicPlusScoresBySeason: [SeasonScores]? = nil,
        mythicPlusRanks: [String: Ranks]? = nil,
        mythicPlusRecentRuns: [DungeonRun]? = nil,
        mythicPlusBestRuns: [DungeonRun]? = nil,
        mythicPlusAlternateRuns: [DungeonRun]? = nil,
        previousMythicPlusRanks: [String: Ranks]? = nil
    ) {
        self.name = name
        self.race = race
        self.class = `class`
        self.activeSpecName = activeSpecName
        self.activeSpecRole = activeSpecRole
        self.gender = gender
        self.faction = faction
        self.region = region
        self.realm = realm
        self.profileUrl = profileUrl
        self.profileBanner = profileBanner
        self.achievementPoints = achievementPoints
        self.thumbnailUrl = thumbnailUrl
        self.lastCrawledAt = lastCrawledAt
        self.gear = gear
        self.raidProgression = raidProgression
        self.mythicPlusScoresBySeason = mythicPlusScoresBySeason
        self.mythicPlusRanks = mythicPlusRanks
        self.mythicPlusRecentRuns = mythicPlusRecentRuns
        self.mythicPlusBestRuns = mythicPlusBestRuns
        self.mythicPlusAlternateRuns = mythicPlusAlternateRuns
        self.previousMythicPlusRanks = previousMythicPlusRanks
    }

}

// MARK: - Helpers

extension Profile {

    // swiftlint:disable line_length
    private static let profileBannerBaseUrl = URL(
        string: "https://cdnassets.raider.io/images/profile/masthead_backdrops/v2")!
    // swiftlint:enable line_length

    public var profileBannerUrl: URL {
        Self.profileBannerBaseUrl.appendingPathComponent(profileBanner).appendingPathExtension("jpg")
    }

}
