//
//  TeamSearchResult.swift
//  RaiderIO
//
//  Created by Sören Gade on 10.03.22.
//

import Foundation

public struct TeamSearchResult {

    public let keystonePlatoonId: Int?
    public let charterId: Int
    public let platoonId: Int?
    public let name: String
    public let slug: String
    public let faction: Faction
    public let region: Region
    public let subRegion: Region?
    public let path: String

    public init(keystonePlatoonId: Int? = nil,
                charterId: Int,
                platoonId: Int? = nil,
                name: String,
                slug: String,
                faction: Faction,
                region: Region,
                subRegion: Region? = nil,
                path: String) {
        self.keystonePlatoonId = keystonePlatoonId
        self.charterId = charterId
        self.platoonId = platoonId
        self.name = name
        self.slug = slug
        self.faction = faction
        self.region = region
        self.subRegion = subRegion
        self.path = path
    }

}

// MARK: - Codable

extension TeamSearchResult: Codable {

    private enum CodingKeys: String, CodingKey {

        case keystonePlatoonId  = "keystone_platoon_id"
        case charterId          = "charter_id"
        case platoonId          = "platoon_id"
        case name
        case slug
        case faction
        case region
        case subRegion
        case path

    }

}
