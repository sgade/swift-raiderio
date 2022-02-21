//
//  StaticMythicPlusData.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public struct StaticMythicPlusData {

    public struct Season {

        public let slug: String
        public let name: String

    }

    public struct Dungeon {

        public let id: Int
        public let challengeModeId: Int
        public let slug: String
        public let name: String
        public let shortName: String

    }

    public let seasons: [Season]
    public let dungeons: [Dungeon]

}

// MARK: - Decodable

extension StaticMythicPlusData: Decodable {}


extension StaticMythicPlusData.Season: Decodable {}


extension StaticMythicPlusData.Dungeon: Decodable {

    private enum CodingKeys: String, CodingKey {

        case id
        case challengeModeId    = "challenge_mode_id"
        case slug
        case name
        case shortName          = "short_name"

    }

}
