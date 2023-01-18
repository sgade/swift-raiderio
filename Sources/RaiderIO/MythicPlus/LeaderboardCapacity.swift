//
//  LeaderboardCapacity.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation

public struct LeaderboardCapacity {

    public struct Affix {

        public let id: Int
        public let icon: String
        public let name: [String: String]
        public let description: [String: String]

        public init(id: Int, icon: String, name: [String: String], description: [String: String]) {
            self.id = id
            self.icon = icon
            self.name = name
            self.description = description
        }

    }

    public struct RealmInfo {

        public struct DungeonInfo {

            public struct LowestDungeonRun {

                public let rank: Int
                public let mythicLevel: Int
                public let timeInMilliseconds: Int

                public init(rank: Int, mythicLevel: Int, timeInMilliseconds: Int) {
                    self.rank = rank
                    self.mythicLevel = mythicLevel
                    self.timeInMilliseconds = timeInMilliseconds
                }

            }

            public let dungeon: Dungeon
            public let lowest: LowestDungeonRun?

            public init(dungeion: Dungeon, lowest: LowestDungeonRun? = nil) {
                self.dungeon = dungeion
                self.lowest = lowest
            }

        }

        public let id: Int
        public let connectedRealms: [Realm]
        public let dungeons: [DungeonInfo]

        public init(id: Int, connectedRealms: [Realm], dungeons: [DungeonInfo]) {
            self.id = id
            self.connectedRealms = connectedRealms
            self.dungeons = dungeons
        }

    }

    public let region: Region
    public let affixes: [Affix]
    public let realms: [RealmInfo]

    public init(region: Region, affixes: [Affix], realms: [RealmInfo]) {
        self.region = region
        self.affixes = affixes
        self.realms = realms
    }

}

// MARK: - Codable

extension LeaderboardCapacity: Codable {}

extension LeaderboardCapacity.Affix: Codable {}

extension LeaderboardCapacity.RealmInfo: Codable {}

extension LeaderboardCapacity.RealmInfo.DungeonInfo: Codable {}

extension LeaderboardCapacity.RealmInfo.DungeonInfo.LowestDungeonRun: Codable {}
