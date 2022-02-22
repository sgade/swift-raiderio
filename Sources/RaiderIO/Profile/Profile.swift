//
//  Profile.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public struct Profile {

    public enum Gender: String, Decodable {

        case male
        case female

    }

    public struct Gear: Decodable {

        private enum CodingKeys: String, CodingKey {

            case itemLevelEquipped  = "item_level_equipped"
            case itemLevelTotal     = "item_level_total"
            case artifactTraits     = "artifact_traits"

        }

        let itemLevelEquipped: Int
        let itemLevelTotal: Int
        let artifactTraits: Int

    }

    public let name: String
    public let race: String
    public let `class`: String
    public let activeSpecName: String
    public let activeSpecRole: String
    public let gender: Gender
    public let faction: Faction
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

}

// MARK: - Decodable

extension Profile: Decodable {

    private enum CodingKeys: String, CodingKey {

        case name
        case race
        case `class`
        case activeSpecName                             = "active_spec_name"
        case activeSpecRole                             = "active_spec_role"
        case gender
        case faction
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

}
