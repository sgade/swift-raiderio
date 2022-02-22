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
        public let durationMs: Int // TODO: use TimeInterval instead
        public let isSuccess: Bool
        public let itemLevelTotalAverage: Float
        public let itemLevelEquippedAverage: Float
        public let itemLevelEquippedMax: Float
        public let itemLevelEquippedMin: Float

    }

    public struct Player {

        public struct Character {

            public let id: Int
//            public let covenant: Any // TODO: define object
            public let name: String
//            public let race: Any // TODO: define object
//            public let `class`: Any // TODO: define object
//            public let spec: Any // TODO: define object
            public let talents: String
//            public let talentsDetails: [Any] // TODO: define object
            public let gender: Gender
            public let thumbnail: URL
            public let itemLevelTotal: Float
            public let itemLevelEquipped: Float
            public let artifactTraits: Float
//            public let realm: Any // TODO: define object
            public let region: Region
//            public let items: [Any] // TODO: define object
//            public let recruitmentProfiles: [Any] // TODO: define object

        }

        public let character: Character

    }

    public let kill: Kill
    public let roster: [Player]

}

// MARK: - Decodable

extension BossKill: Decodable {}


extension BossKill.Kill: Decodable {

    private enum CodingKeys: String, CodingKey {

        case pulledAt
        case defeatedAt
        case durationMs
        case isSuccess
        case itemLevelTotalAverage      = "itemLevelTotalAvg"
        case itemLevelEquippedAverage   = "itemLevelEquippedAvg"
        case itemLevelEquippedMax
        case itemLevelEquippedMin

    }

}


extension BossKill.Player: Decodable {}
extension BossKill.Player.Character: Decodable {}
