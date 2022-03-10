//
//  GuildSearchResult.swift
//  RaiderIO
//
//  Created by Sören Gade on 10.03.22.
//


import Foundation


public struct GuildSearchResult {

    public let id: Int
    public let name: String
    public let faction: Faction
    public let realm: Realm
    public let region: Region
    public let path: String

}

// MARK: - Decodable

extension GuildSearchResult: Decodable {}
