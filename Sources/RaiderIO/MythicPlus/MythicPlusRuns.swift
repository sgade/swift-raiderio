//
//  MythicPlusRuns.swift
//  RaiderIO
//
//  Created by Sören Gade on 23.02.22.
//


import Foundation


public struct MythicPlusRuns {

    public struct Parameters {

        public let season: String
        public let region: RegionSlug
        public let dungeon: String
        public let page: Int

    }

    public let rankings: [MythicPlusRanking]
    public let leaderboardUrl: URL
    public let parameters: Parameters

}


public struct MythicPlusRanking {

    public struct Run {

        public let season: String
        public let keystoneRunId: Int
        public let keystoneTeamId: Int
        public let keystonePlatoonId: Int?
        public let mythicLevel: Int
        public let clearTimeMs: Int // TODO: use TimeInterval instead
        public let keystoneTimeMs: Int // TODO: use TimeInterval instead
        public let completedAt: ISO8601Date
        public let numberOfChests: Int
        public let timeRemainingMs: Int // TODO: use TimeInterval instead
        public let faction: Faction
        public let weeklyModifiers: [Affix]
        public let numberOfActiveModifiers: Int
//        public let roster: Any // FIXME: Implement type
//        public let platoon: Any // FIXME: Implement type

    }

    public let rank: Int
    public let score: Float
    public let run: Run

}

// MARK: - Decodable

extension MythicPlusRuns: Decodable {

    private enum CodingKeys: String, CodingKey {

        case rankings
        case leaderboardUrl = "leaderboard_url"
        case parameters     = "params"

    }

}


extension MythicPlusRuns.Parameters: Decodable {}


extension MythicPlusRanking: Decodable {}


extension MythicPlusRanking.Run: Decodable {

    private enum CodingKeys: String, CodingKey {

        case season
        case keystoneRunId              = "keystone_run_id"
        case keystoneTeamId             = "keystone_team_id"
        case keystonePlatoonId          = "keystone_platoon_id"
        case mythicLevel                = "mythic_level"
        case clearTimeMs                = "clear_time_ms"
        case keystoneTimeMs             = "keystone_time_ms"
        case completedAt                = "completed_at"
        case numberOfChests             = "num_chests"
        case timeRemainingMs            = "time_remaining_ms"
        case faction
        case weeklyModifiers            = "weekly_modifiers"
        case numberOfActiveModifiers    = "num_modifiers_active"
//        case roster
//        case platoon

    }

}
