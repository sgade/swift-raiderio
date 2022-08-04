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
        case shortName  = "short_name"

    }

}
