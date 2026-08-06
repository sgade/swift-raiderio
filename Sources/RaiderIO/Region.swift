//
//  Region.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation

public struct Region {

    public let name: String
    public let slug: RegionSlug
    public let shortName: String

    public init(name: String, slug: RegionSlug, shortName: String) {
        self.name = name
        self.slug = slug
        self.shortName = shortName
    }

}

// MARK: - Codable

extension Region: Codable {

    private enum CodingKeys: String, CodingKey {

        case name
        case slug
        case shortName = "short_name"

    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        slug = RegionSlug(rawValue: try container.decode(String.self, forKey: .slug))
        shortName = try container.decode(String.self, forKey: .shortName)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(slug.rawValue, forKey: .slug)
        try container.encode(shortName, forKey: .shortName)
    }

}
