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

    }

    public struct Realm {

        public struct ConnectedRealm {

            public let id: Int
            public let connectedRealmId: Int
            public let name: String
            public let altName: String?
            public let slug: String
            public let altSlug: String
            public let locale: String
            public let isConnected: Bool

        }

        public struct DungeonInfo {

            public struct Dungeon {

                public let id: Int
                public let name: String
                public let shortName: String
                public let slug: String
                public let expansion: Expansion
                public let patch: String
                public let keystoneTimerMs: Int // TODO: Use TimeInterval instead

            }

            public struct LowestDungeonRun {

                public let rank: Int
                public let mythicLevel: Int
                public let timeInMilliseconds: Int

            }

            public let dungeon: Dungeon
            public let lowest: LowestDungeonRun?

        }

        public let id: Int
        public let connectedRealms: [ConnectedRealm]
        public let dungeons: [DungeonInfo]

    }

    let region: Region
    let affixes: [Affix]
    let realms: [Realm]

}

// MARK: - Decodable

extension LeaderboardCapacity: Decodable {}


extension LeaderboardCapacity.Affix: Decodable {}


extension LeaderboardCapacity.Realm: Decodable {}


extension LeaderboardCapacity.Realm.ConnectedRealm: Decodable {}


extension LeaderboardCapacity.Realm.DungeonInfo: Decodable {}


extension LeaderboardCapacity.Realm.DungeonInfo.Dungeon: Decodable {

    private enum CodingKeys: String, CodingKey {

        case id
        case name
        case shortName          = "short_name"
        case slug
        case expansion          = "expansion_id"
        case patch
        case keystoneTimerMs    = "keystone_timer_ms"

    }

}


extension LeaderboardCapacity.Realm.DungeonInfo.LowestDungeonRun: Decodable {}
