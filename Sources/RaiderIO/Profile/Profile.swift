//
//  Profile.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation

public struct Profile {

    public struct Gear: Codable {

        private enum CodingKeys: String, CodingKey {

            case itemLevelEquipped  = "item_level_equipped"
            case itemLevelTotal     = "item_level_total"
            case artifactTraits     = "artifact_traits"

        }

        public let itemLevelEquipped: Float
        public let itemLevelTotal: Float
        public let artifactTraits: Float

        public init(itemLevelEquipped: Float, itemLevelTotal: Float, artifactTraits: Float) {
            self.itemLevelEquipped = itemLevelEquipped
            self.itemLevelTotal = itemLevelTotal
            self.artifactTraits = artifactTraits
        }

    }

    public struct Guild {

        public let name: String
        public let realm: String

        public init(name: String, realm: String) {
            self.name = name
            self.realm = realm
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
    public let honorableKills: Int
    public let thumbnailUrl: URL
    public let lastCrawledAt: ISO8601Date

    public let gear: Gear?
    public let guild: Guild?
    public let covenant: Covenant?

    public let raidProgression: [String: RaidProgression]?

    public let mythicPlusScoresBySeason: [SeasonScores]?
    public let mythicPlusRanks: [String: Ranks]?
    public let mythicPlusRecentRuns: [DungeonRun]?
    public let mythicPlusBestRuns: [DungeonRun]?
    public let mythicPlusAlternateRuns: [DungeonRun]?
    public let mythicPlusHighestLevelRuns: [DungeonRun]?
    public let mythicPlusWeeklyHighestLevelRuns: [DungeonRun]?
    public let mythicPlusPreviousWeeklyHighestLevelRuns: [DungeonRun]?
    public let previousMythicPlusRanks: [String: Ranks]?

    public let raidAchievementMeta: [RaidAchievementMeta]?
    public let raidAchievementCurve: [RaidAchievementCurve]?

    public init(name: String,
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
                honorableKills: Int,
                thumbnailUrl: URL,
                lastCrawledAt: ISO8601Date,
                gear: Gear? = nil,
                guild: Guild? = nil,
                covenant: Covenant? = nil,
                raidProgression: [String: RaidProgression]? = nil,
                mythicPlusScoresBySeason: [SeasonScores]? = nil,
                mythicPlusRanks: [String: Ranks]? = nil,
                mythicPlusRecentRuns: [DungeonRun]? = nil,
                mythicPlusBestRuns: [DungeonRun]? = nil,
                mythicPlusAlternateRuns: [DungeonRun]? = nil,
                mythicPlusHighestLevelRuns: [DungeonRun]? = nil,
                mythicPlusWeeklyHighestLevelRuns: [DungeonRun]? = nil,
                mythicPlusPreviousWeeklyHighestLevelRuns: [DungeonRun]? = nil,
                previousMythicPlusRanks: [String: Ranks]? = nil,
                raidAchievementMeta: [RaidAchievementMeta]? = nil,
                raidAchievementCurve: [RaidAchievementCurve]? = nil) {
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
        self.honorableKills = honorableKills
        self.thumbnailUrl = thumbnailUrl
        self.lastCrawledAt = lastCrawledAt
        self.gear = gear
        self.guild = guild
        self.covenant = covenant
        self.raidProgression = raidProgression
        self.mythicPlusScoresBySeason = mythicPlusScoresBySeason
        self.mythicPlusRanks = mythicPlusRanks
        self.mythicPlusRecentRuns = mythicPlusRecentRuns
        self.mythicPlusBestRuns = mythicPlusBestRuns
        self.mythicPlusAlternateRuns = mythicPlusAlternateRuns
        self.mythicPlusHighestLevelRuns = mythicPlusHighestLevelRuns
        self.mythicPlusWeeklyHighestLevelRuns = mythicPlusWeeklyHighestLevelRuns
        self.mythicPlusPreviousWeeklyHighestLevelRuns = mythicPlusPreviousWeeklyHighestLevelRuns
        self.previousMythicPlusRanks = previousMythicPlusRanks
        self.raidAchievementMeta = raidAchievementMeta
        self.raidAchievementCurve = raidAchievementCurve
    }

}

// MARK: - Helpers

extension Profile {

    // swiftlint:disable line_length
    private static let profileBannerBaseUrl = URL(string: "https://cdnassets.raider.io/images/profile/masthead_backdrops/v2")!
    // swiftlint:enable line_length

    public var profileBannerUrl: URL {
        Self.profileBannerBaseUrl.appendingPathComponent(profileBanner).appendingPathExtension("jpg")
    }

}

// MARK: - Codable

extension Profile: Codable {

    private enum CodingKeys: String, CodingKey {

        case name
        case race
        case `class`
        case activeSpecName                             = "active_spec_name"
        case activeSpecRole                             = "active_spec_role"
        case gender
        case faction
        case region
        case realm
        case profileUrl                                 = "profile_url"
        case profileBanner                              = "profile_banner"
        case achievementPoints                          = "achievement_points"
        case honorableKills                             = "honorable_kills"
        case thumbnailUrl                               = "thumbnail_url"
        case lastCrawledAt                              = "last_crawled_at"

        case gear
        case guild
        case covenant

        case raidProgression                            = "raid_progression"

        case mythicPlusScoresBySeason                   = "mythic_plus_scores_by_season"
        case mythicPlusRanks                            = "mythic_plus_ranks"
        case mythicPlusRecentRuns                       = "mythic_plus_recent_runs"
        case mythicPlusBestRuns                         = "mythic_plus_best_runs"
        case mythicPlusAlternateRuns                    = "mythic_plus_alternate_runs"
        case mythicPlusHighestLevelRuns                 = "mythic_plus_highest_level_runs"
        case mythicPlusWeeklyHighestLevelRuns           = "mythic_plus_weekly_highest_level_runs"
        case mythicPlusPreviousWeeklyHighestLevelRuns   = "mythic_plus_previous_weekly_highest_level_runs"
        case previousMythicPlusRanks                    = "previous_mythic_plus_ranks"

        case raidAchievementMeta                        = "raid_achievement_meta"
        case raidAchievementCurve                       = "raid_achievement_curve"

    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        race = try container.decode(String.self, forKey: .race)
        `class` = try container.decode(String.self, forKey: .class)
        activeSpecName = try container.decode(String.self, forKey: .activeSpecName)
        activeSpecRole = try container.decode(Role.self, forKey: .activeSpecRole)
        gender = try container.decode(Gender.self, forKey: .gender)
        faction = try container.decode(Faction.self, forKey: .faction)
        region = try container.decode(RegionSlug.self, forKey: .region)
        realm = try container.decode(String.self, forKey: .realm)

        profileUrl = try container.decode(SpecialCharactersURL.self, forKey: .profileUrl).url
        profileBanner = try container.decode(String.self, forKey: .profileBanner)
        achievementPoints = try container.decode(Int.self, forKey: .achievementPoints)
        honorableKills = try container.decode(Int.self, forKey: .honorableKills)
        thumbnailUrl = try container.decode(URL.self, forKey: .thumbnailUrl)
        lastCrawledAt = try container.decode(ISO8601Date.self, forKey: .lastCrawledAt)

        gear = try container.decodeIfPresent(Gear.self, forKey: .gear)
        guild = try container.decodeIfPresent(Guild.self, forKey: .guild)
        covenant = try container.decodeIfPresent(Covenant.self, forKey: .covenant)

        raidProgression = try container.decodeIfPresent([String: RaidProgression].self, forKey: .raidProgression)

        mythicPlusScoresBySeason = try container.decodeIfPresent([SeasonScores].self, forKey: .mythicPlusScoresBySeason)
        mythicPlusRanks = try container.decodeIfPresent([String: Ranks].self, forKey: .mythicPlusRanks)
        mythicPlusRecentRuns = try container.decodeIfPresent([DungeonRun].self, forKey: .mythicPlusRecentRuns)
        mythicPlusBestRuns = try container.decodeIfPresent([DungeonRun].self, forKey: .mythicPlusBestRuns)
        mythicPlusAlternateRuns = try container.decodeIfPresent([DungeonRun].self, forKey: .mythicPlusAlternateRuns)
        mythicPlusHighestLevelRuns = try container.decodeIfPresent([DungeonRun].self, forKey: .mythicPlusHighestLevelRuns)
        mythicPlusWeeklyHighestLevelRuns = try container.decodeIfPresent([DungeonRun].self, forKey: .mythicPlusWeeklyHighestLevelRuns)
        mythicPlusPreviousWeeklyHighestLevelRuns = try container.decodeIfPresent([DungeonRun].self, forKey: .mythicPlusPreviousWeeklyHighestLevelRuns)
        previousMythicPlusRanks = try container.decodeIfPresent([String: Ranks].self, forKey: .previousMythicPlusRanks)

        raidAchievementMeta = try container.decodeIfPresent([RaidAchievementMeta].self, forKey: .raidAchievementMeta)
        raidAchievementCurve = try container.decodeIfPresent([RaidAchievementCurve].self, forKey: .raidAchievementCurve)
    }

}

extension Profile.Guild: Codable {}
