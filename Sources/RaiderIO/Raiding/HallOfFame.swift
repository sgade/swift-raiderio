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

            public init(encounterId: Int, name: String, slug: String, ordinal: Int, wingId: Int, iconUrl: String) {
                self.encounterId = encounterId
                self.name = name
                self.slug = slug
                self.ordinal = ordinal
                self.wingId = wingId
                self.iconUrl = iconUrl
            }

        }

        public struct BossKillVideo {

            public let type: String
            public let id: String
            public let time: String?

            public init(type: String, id: String, time: String? = nil) {
                self.type = type
                self.id = id
                self.time = time
            }

        }

        public struct DefeatedBy {

            public let totalCount: Int
            public let guilds: [KillGuild]

            public init(totalCount: Int, guilds: [KillGuild]) {
                self.totalCount = totalCount
                self.guilds = guilds
            }

        }

        public struct AttemptedBy {

            public let totalCount: Int
            public let attempts: [KillGuild]

            public init(totalCount: Int, attempts: [KillGuild]) {
                self.totalCount = totalCount
                self.attempts = attempts
            }

        }

        public let boss: String
        public let bossSummary: BossSummary
        public let bossKillVideo: BossKillVideo
        public let defeatedBy: DefeatedBy
        public let attemptedBy: AttemptedBy

        public init(boss: String,
                    bossSummary: BossSummary,
                    bossKillVideo: BossKillVideo,
                    defeatedAt: DefeatedBy,
                    attemptedBy: AttemptedBy) {
            self.boss = boss
            self.bossSummary = bossSummary
            self.bossKillVideo = bossKillVideo
            self.defeatedBy = defeatedAt
            self.attemptedBy = attemptedBy
        }

    }

    public struct WinningGuild {

        public let rank: Int
        public let guild: Guild
        public let encountersDefeated: [DefeatedEncounter]
        public let streamers: Streamers
        public let recruitmentProfiles: [RecruitmentProfile]

        public init(rank: Int,
                    guild: Guild,
                    encountersDefated: [DefeatedEncounter],
                    streamers: Streamers,
                    recruitmentProfiles: [RecruitmentProfile]) {
            self.rank = rank
            self.guild = guild
            self.encountersDefeated = encountersDefated
            self.streamers = streamers
            self.recruitmentProfiles = recruitmentProfiles
        }

    }

    public let bossKills: [BossKill]
    public let winningGuilds: [WinningGuild]

    public init(bossKills: [BossKill], winningGuilds: [WinningGuild]) {
        self.bossKills = bossKills
        self.winningGuilds = winningGuilds
    }

}

public struct KillGuild {

    public let guild: Guild
    public let defeatedAt: ISO8601Date?
    public let streamers: Streamers
    public let recruitmentProfiles: [RecruitmentProfile]

    public init(guild: Guild,
                defeatedAt: ISO8601Date? = nil,
                streamers: Streamers,
                recruitmentProfiles: [RecruitmentProfile]) {
        self.guild = guild
        self.defeatedAt = defeatedAt
        self.streamers = streamers
        self.recruitmentProfiles = recruitmentProfiles
    }

}

// MARK: - Codable

extension HallOfFame: Codable {}

extension HallOfFame.BossKill: Codable {}

extension HallOfFame.BossKill.BossSummary: Codable {}

extension HallOfFame.BossKill.BossKillVideo: Codable {}

extension HallOfFame.BossKill.DefeatedBy: Codable {}

extension HallOfFame.BossKill.AttemptedBy: Codable {}

extension HallOfFame.WinningGuild: Codable {}

extension KillGuild: Codable {}
