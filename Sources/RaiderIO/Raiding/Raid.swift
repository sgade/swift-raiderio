//
//  Raid.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//


import Foundation


public struct Raid {

    public struct Encounter {

        public let id: Int
        public let slug: String
        public let name: String

    }

    public let id: Int
    public let slug: RaidSlug
    public let name: String
    public let shortName: String
    public let encounters: [Encounter]

}

// MARK: - Decodable

extension Raid: Decodable {

    private enum CodingKeys: String, CodingKey {

        case id
        case slug
        case name
        case shortName      = "short_name"
        case encounters

    }

}


extension Raid.Encounter: Decodable {}
