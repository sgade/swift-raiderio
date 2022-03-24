//
//  DungeonRun.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public struct DungeonRun {

    public let dungeon: String
    public let shortName: String
    public let mythicLevel: Int
    public let completedAt: ISO8601Date
    public let clearTime: Milliseconds
    public let parTime: Milliseconds
    public let numberOfKeystoneUpgrades: Int
    public let mapChallengeModeId: Int
    public let zoneId: Int
    public let score: Double
    public let affixes: [Affix]
    public let url: URL

    public init(dungeon: String,
                shortName: String,
                mythicLevel: Int,
                completedAt: ISO8601Date,
                clearTime: Milliseconds,
                parTime: Milliseconds,
                numberOfKeystoneUpgrades: Int,
                mapChallengeModeId: Int,
                zoneId: Int,
                score: Double,
                affixes: [Affix],
                url: URL) {
        self.dungeon = dungeon
        self.shortName = shortName
        self.mythicLevel = mythicLevel
        self.completedAt = completedAt
        self.clearTime = clearTime
        self.parTime = parTime
        self.numberOfKeystoneUpgrades = numberOfKeystoneUpgrades
        self.mapChallengeModeId = mapChallengeModeId
        self.zoneId = zoneId
        self.score = score
        self.affixes = affixes
        self.url = url
    }

}

// MARK: - Codable

extension DungeonRun: Codable {

    private enum CodingKeys: String, CodingKey {

        case dungeon
        case shortName                  = "short_name"
        case mythicLevel                = "mythic_level"
        case completedAt                = "completed_at"
        case clearTime                  = "clear_time_ms"
        case parTime                    = "par_time_ms"
        case numberOfKeystoneUpgrades   = "num_keystone_upgrades"
        case mapChallengeModeId         = "map_challenge_mode_id"
        case zoneId                     = "zone_id"
        case score
        case affixes
        case url

    }

}
