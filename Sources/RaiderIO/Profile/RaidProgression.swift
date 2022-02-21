//
//  RaidProgression.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public struct RaidProgression {

    public let summary: String
    public let totalBosses: Int
    public let normalBossesKilled: Int
    public let heroicBossesKilled: Int
    public let mythicBossesKilled: Int

}

// MARK: - Decodable

extension RaidProgression: Decodable {

    private enum CodingKeys: String, CodingKey {

        case summary
        case totalBosses        = "total_bosses"
        case normalBossesKilled = "normal_bosses_killed"
        case heroicBossesKilled = "heroic_bosses_killed"
        case mythicBossesKilled = "mythic_bosses_killed"

    }

}
