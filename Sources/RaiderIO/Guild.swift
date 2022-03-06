//
//  Guild.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//


import Foundation


public struct Guild {

    public let id: Int
    public let name: String
    public let faction: Faction
    public let realm: Realm
    public let region: Region
    public let path: String
    public let logo: URL?

    public init(id: Int,
                name: String,
                faction: Faction,
                realm: Realm,
                region: Region,
                path: String,
                logo: URL? = nil) {
        self.id = id
        self.name = name
        self.faction = faction
        self.realm = realm
        self.region = region
        self.path = path
        self.logo = logo
    }

}

// MARK: - Decodable

extension Guild: Decodable {}
