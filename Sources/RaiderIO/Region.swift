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

}

public enum RegionSlug: String {

    case cn
    case eu
    case kr
    case tw
    case us

}

// MARK: - Codable

extension Region: Decodable {

    private enum CodingKeys: String, CodingKey {

        case name
        case slug
        case shortName  = "short_name"

    }

}


extension RegionSlug: Codable {}
