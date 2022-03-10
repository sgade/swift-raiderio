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

}

// MARK: - Decodable

extension TeamSearchResult: Decodable {

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
