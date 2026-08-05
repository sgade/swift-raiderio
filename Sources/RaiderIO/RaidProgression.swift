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
