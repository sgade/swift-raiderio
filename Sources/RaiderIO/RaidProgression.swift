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

    public init(summary: String,
                totalBosses: Int,
                normalBossesKilled: Int,
                heroicBossesKilled: Int,
                mythicBossesKilled: Int) {
        self.summary = summary
        self.totalBosses = totalBosses
        self.normalBossesKilled = normalBossesKilled
        self.heroicBossesKilled = heroicBossesKilled
        self.mythicBossesKilled = mythicBossesKilled
    }

}

// MARK: - Codable

extension RaidProgression: Codable {

    private enum CodingKeys: String, CodingKey {

        case summary
        case totalBosses        = "total_bosses"
        case normalBossesKilled = "normal_bosses_killed"
        case heroicBossesKilled = "heroic_bosses_killed"
        case mythicBossesKilled = "mythic_bosses_killed"

    }

}
