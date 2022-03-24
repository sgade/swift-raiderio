//
//  BossKill.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//


import Foundation


public struct BossKill {

    public struct Kill {

        public let pulledAt: ISO8601Date
        public let defeatedAt: ISO8601Date
        public let duration: Milliseconds
        public let isSuccess: Bool
        public let itemLevelTotalAverage: Float
        public let itemLevelEquippedAverage: Float
        public let itemLevelEquippedMax: Float
        public let itemLevelEquippedMin: Float

        public init(pulledAt: ISO8601Date,
                    defeatedAt: ISO8601Date,
                    duration: Milliseconds,
                    isSuccess: Bool,
                    itemLevelTotalAverage: Float,
                    itemLevelEquippedAverage: Float,
                    itemLevelEquippedMax: Float,
                    itemLevelEquippedMin: Float) {
            self.pulledAt = pulledAt
            self.defeatedAt = defeatedAt
            self.duration = duration
            self.isSuccess = isSuccess
            self.itemLevelTotalAverage = itemLevelTotalAverage
            self.itemLevelEquippedAverage = itemLevelEquippedAverage
            self.itemLevelEquippedMax = itemLevelEquippedMax
            self.itemLevelEquippedMin = itemLevelEquippedMin
        }

    }

    public let kill: Kill
    public let roster: [Character]

    public init(kill: Kill, roster: [Character]) {
        self.kill = kill
        self.roster = roster
    }

}

// MARK: - Codable

extension BossKill: Codable {}


extension BossKill.Kill: Codable {

    private enum CodingKeys: String, CodingKey {

        case pulledAt
        case defeatedAt
        case duration                   = "durationMs"
        case isSuccess
        case itemLevelTotalAverage      = "itemLevelTotalAvg"
        case itemLevelEquippedAverage   = "itemLevelEquippedAvg"
        case itemLevelEquippedMax
        case itemLevelEquippedMin

    }

}
