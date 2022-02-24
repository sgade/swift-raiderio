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

}

// MARK: - Decodable

extension BossRanking: Decodable {}
