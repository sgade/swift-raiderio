//
//  HallOfFame.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//


import Foundation


public struct HallOfFame {

    public struct BossKill {

        public struct BossSummary {

            public let encounterId: Int
            public let name: String
            public let slug: String
            public let ordinal: Int
            public let wingId: Int
            public let iconUrl: String

        }

        public struct BossKillVideo {

            public let type: String
            public let id: String
            public let time: String?

        }

        public struct KillGuild {

            public let guild: Guild
            public let defeatedAt: String?
            public let streamers: Streamers
            public let recruitmentProfiles: [RecruitmentProfile]

        }

        public struct DefeatedBy {

            public let totalCount: Int
            public let guilds: [KillGuild]

        }

        public struct AttemptedBy {

            public let totalCount: Int
            public let attempts: [KillGuild]

        }

        public let boss: String
        public let bossSummary: BossSummary
        public let bossKillVideo: BossKillVideo
        public let defeatedBy: DefeatedBy
        public let attemptedBy: AttemptedBy

    }

    public struct WinningGuild {

        public let rank: Int
        public let guild: Guild
        public let encountersDefeated: [DefeatedEncounter]
        public let streamers: Streamers
        public let recruitmentProfiles: [RecruitmentProfile]

    }

    public let bossKills: [BossKill]
    public let winningGuilds: [WinningGuild]

}

// MARK: - Decodable

extension HallOfFame: Decodable {}

extension HallOfFame.BossKill: Decodable {}

extension HallOfFame.BossKill.BossSummary: Decodable {}

extension HallOfFame.BossKill.BossKillVideo: Decodable {}

extension HallOfFame.BossKill.DefeatedBy: Decodable {}

extension HallOfFame.BossKill.KillGuild: Decodable {}

extension HallOfFame.BossKill.AttemptedBy: Decodable {}

extension HallOfFame.WinningGuild: Decodable {}
