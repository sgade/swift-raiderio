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

        public init(season: String, region: RegionSlug, dungeon: String, page: Int) {
            self.season = season
            self.region = region
            self.dungeon = dungeon
            self.page = page
        }

    }

    public let rankings: [MythicPlusRanking]
    public let leaderboardUrl: URL
    public let parameters: Parameters

    public init(rankings: [MythicPlusRanking], leaderboardUrl: URL, parameters: Parameters) {
        self.rankings = rankings
        self.leaderboardUrl = leaderboardUrl
        self.parameters = parameters
    }

}


public struct MythicPlusRanking {

    public struct Run {

        public let season: String
        public let keystoneRunId: Int
        public let keystoneTeamId: Int
        public let keystonePlatoonId: Int?
        public let mythicLevel: Int
        public let clearTime: Milliseconds
        public let keystoneTime: Milliseconds
        public let completedAt: ISO8601Date
        public let numberOfChests: Int
        public let timeRemaining: Milliseconds
        public let faction: Faction
        public let weeklyModifiers: [Affix]
        public let numberOfActiveModifiers: Int
//        public let roster: Any // FIXME: Implement type
//        public let platoon: Any // FIXME: Implement type


        public init(season: String,
                    keystoneRunId: Int,
                    keystoneTeamId: Int,
                    keystonePlatoonId: Int? = nil,
                    mythicLevel: Int,
                    clearTime: Milliseconds,
                    keystoneTime: Milliseconds,
                    completedAt: ISO8601Date,
                    numberOfChests: Int,
                    timeRemaining: Milliseconds,
                    faction: Faction,
                    weeklyModifiers: [Affix],
                    numberOfActiveModifiers: Int) {
            self.season = season
            self.keystoneRunId = keystoneRunId
            self.keystoneTeamId = keystoneTeamId
            self.keystonePlatoonId = keystonePlatoonId
            self.mythicLevel = mythicLevel
            self.clearTime = clearTime
            self.keystoneTime = keystoneTime
            self.completedAt = completedAt
            self.numberOfChests = numberOfChests
            self.timeRemaining = timeRemaining
            self.faction = faction
            self.weeklyModifiers = weeklyModifiers
            self.numberOfActiveModifiers = numberOfActiveModifiers
        }

    }

    public let rank: Int
    public let score: Float
    public let run: Run

    public init(rank: Int, score: Float, run: Run) {
        self.rank = rank
        self.score = score
        self.run = run
    }

}

// MARK: - Codable

extension MythicPlusRuns: Codable {

    private enum CodingKeys: String, CodingKey {

        case rankings
        case leaderboardUrl = "leaderboard_url"
        case parameters     = "params"

    }

}


extension MythicPlusRuns.Parameters: Codable {}


extension MythicPlusRanking: Codable {}


extension MythicPlusRanking.Run: Codable {

    private enum CodingKeys: String, CodingKey {

        case season
        case keystoneRunId              = "keystone_run_id"
        case keystoneTeamId             = "keystone_team_id"
        case keystonePlatoonId          = "keystone_platoon_id"
        case mythicLevel                = "mythic_level"
        case clearTime                  = "clear_time_ms"
        case keystoneTime               = "keystone_time_ms"
        case completedAt                = "completed_at"
        case numberOfChests             = "num_chests"
        case timeRemaining              = "time_remaining_ms"
        case faction
        case weeklyModifiers            = "weekly_modifiers"
        case numberOfActiveModifiers    = "num_modifiers_active"
//        case roster
//        case platoon

    }

}
