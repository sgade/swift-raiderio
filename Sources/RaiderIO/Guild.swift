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

}

// MARK: - Decodable

extension Guild: Decodable {}
