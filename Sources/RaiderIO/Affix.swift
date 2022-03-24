//
//  Affix.swift
//  RaiderIO
//
//  Created by Sören Gade on 23.02.22.
//


import Foundation


public struct Affix {

    public let id: Int
    public let name: String
    public let description: String
    public let icon: String
    public let wowheadUrl: URL?

    public init(id: Int,
                name: String,
                description: String,
                icon: String,
                wowheadUrl: URL? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.icon = icon
        self.wowheadUrl = wowheadUrl
    }

}

// MARK: - Codable

extension Affix: Codable {

    private enum CodingKeys: String, CodingKey {

        case id
        case name
        case description
        case icon
        case wowheadUrl     = "wowhead_url"

    }

}
