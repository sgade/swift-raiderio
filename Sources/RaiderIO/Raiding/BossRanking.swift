//
//  BossRanking.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//

import Foundation

public struct BossRanking {

    public let rank: Int
    public let regionRank: Int
    public let guild: Guild
    public let encountersDefeated: [DefeatedEncounter]
    public let streamers: Streamers
    public let recruitmentProfiles: [RecruitmentProfile]
    public let itemLevelAvg: Float

    public init(rank: Int,
                regionRank: Int,
                guild: Guild,
                encountersDefeated: [DefeatedEncounter],
                streamers: Streamers,
                recruitmentProfiles: [RecruitmentProfile],
                itemLevelAvg: Float) {
        self.rank = rank
        self.regionRank = regionRank
        self.guild = guild
        self.encountersDefeated = encountersDefeated
        self.streamers = streamers
        self.recruitmentProfiles = recruitmentProfiles
        self.itemLevelAvg = itemLevelAvg
    }

}

// MARK: - Codable

extension BossRanking: Codable {}
