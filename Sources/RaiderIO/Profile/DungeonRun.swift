//
//  DungeonRun.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public struct DungeonRun {

    public struct Affix {

        public let id: Int
        public let name: String
        public let description: String
        public let icon: String
        public let wowheadUrl: URL

    }

    public let dungeon: String
    public let shortName: String
    public let mythicLevel: Int
    public let completedAt: ISO8601Date
    public let clearTimeMs: Int // TODO: parse this as TimeInterval
    public let parTimeMs: Int // TODO: parse this as TimeInterval
    public let numberOfKeystoneUpgrades: Int
    public let mapChallengeModeId: Int
    public let zoneId: Int
    public let score: Double
    public let affixes: [Affix]
    public let url: URL

}

// MARK: - Decodable

extension DungeonRun: Decodable {

    private enum CodingKeys: String, CodingKey {

        case dungeon
        case shortName                  = "short_name"
        case mythicLevel                = "mythic_level"
        case completedAt                = "completed_at"
        case clearTimeMs                = "clear_time_ms"
        case parTimeMs                  = "par_time_ms"
        case numberOfKeystoneUpgrades   = "num_keystone_upgrades"
        case mapChallengeModeId         = "map_challenge_mode_id"
        case zoneId                     = "zone_id"
        case score
        case affixes
        case url

    }

}

extension DungeonRun.Affix: Decodable {

    private enum CodingKeys: String, CodingKey {

        case id
        case name
        case description
        case icon
        case wowheadUrl     = "wowhead_url"

    }

}
