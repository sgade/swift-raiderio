//
//  Dungeon.swift
//  RaiderIO
//
//  Created by Sören Gade on 17.01.23.
//

import Foundation

public struct Dungeon {

    public let id: Int
    public let name: String
    public let shortName: String
    public let slug: String
    public let expansion: Expansion
    public let patch: String
    public let keystoneTimer: Milliseconds
    public let numberOfBosses: Int?

    public init(id: Int,
                name: String,
                shortName: String,
                slug: String,
                expansion: Expansion,
                patch: String,
                keystoneTimer: Milliseconds,
                numberOfBosses: Int? = nil) {
        self.id = id
        self.name = name
        self.shortName = shortName
        self.slug = slug
        self.expansion = expansion
        self.patch = patch
        self.keystoneTimer = keystoneTimer
        self.numberOfBosses = numberOfBosses
    }

}

// MARK: - Codable

extension Dungeon: Codable {

    private enum CodingKeys: String, CodingKey {

        case id
        case name
        case shortName          = "short_name"
        case slug
        case expansion          = "expansion_id"
        case patch
        case keystoneTimer      = "keystone_timer_ms"
        case numberOfBosses     = "num_bosses"

    }

}
