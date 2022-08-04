//
//  CharacterSearchResult.swift
//  RaiderIO
//
//  Created by Sören Gade on 10.03.22.
//

import Foundation

public struct CharacterSearchResult {

    public let id: Int
    public let name: String
    public let faction: Faction
    public let region: Region
    public let realm: Realm
    public let `class`: Class

    public init(id: Int, name: String, faction: Faction, region: Region, realm: Realm, class: Class) {
        self.id = id
        self.name = name
        self.faction = faction
        self.region = region
        self.realm = realm
        self.class = `class`
    }

}

// MARK: - Codable

extension CharacterSearchResult: Codable {}
