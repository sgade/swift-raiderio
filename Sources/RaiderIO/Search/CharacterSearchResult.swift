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

}

// MARK: - Decodable

extension CharacterSearchResult: Decodable {}
