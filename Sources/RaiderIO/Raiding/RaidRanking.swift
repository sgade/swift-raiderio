//
//  RaidRanking.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//


import Foundation


public struct RaidRanking {

    public let rank: Int
    public let regionRank: Int
    public let guild: Guild
    public let encountersDefeated: [DefeatedEncounter]
    public let streamers: Streamers
    public let recruitmentProfiles: [RecruitmentProfile]

}

// MARK: - Decodable

extension RaidRanking: Decodable {}
