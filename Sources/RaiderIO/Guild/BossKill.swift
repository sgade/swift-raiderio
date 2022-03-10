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

        public init(pulledAt: ISO8601Date,
                    defeatedAt: ISO8601Date,
                    durationMs: Int,
                    isSuccess: Bool,
                    itemLevelTotalAverage: Float,
                    itemLevelEquippedAverage: Float,
                    itemLevelEquippedMax: Float,
                    itemLevelEquippedMin: Float) {
            self.pulledAt = pulledAt
            self.defeatedAt = defeatedAt
            self.durationMs = durationMs
            self.isSuccess = isSuccess
            self.itemLevelTotalAverage = itemLevelTotalAverage
            self.itemLevelEquippedAverage = itemLevelEquippedAverage
            self.itemLevelEquippedMax = itemLevelEquippedMax
            self.itemLevelEquippedMin = itemLevelEquippedMin
        }

    }

    public struct Player {

        public struct Character {

            public let id: Int
//            public let covenant: Any // TODO: define object
            public let name: String
            public let race: Race
            public let `class`: Class
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

            public init(id: Int,
                        name: String,
                        race: Race,
                        class: Class,
                        talents: String,
                        gender: Gender,
                        thumbnail: URL,
                        itemLevelTotal: Float,
                        itemLevelEquipped: Float,
                        artifactTraits: Float,
                        region: Region) {
                self.id = id
                self.name = name
                self.race = race
                self.class = `class`
                self.talents = talents
                self.gender = gender
                self.thumbnail = thumbnail
                self.itemLevelTotal = itemLevelTotal
                self.itemLevelEquipped = itemLevelEquipped
                self.artifactTraits = artifactTraits
                self.region = region
            }

        }

        public let character: Character

        public init(character: Character) {
            self.character = character
        }

    }

    public let kill: Kill
    public let roster: [Player]

    public init(kill: Kill, roster: [Player]) {
        self.kill = kill
        self.roster = roster
    }

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
