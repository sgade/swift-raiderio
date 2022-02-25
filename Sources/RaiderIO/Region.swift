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


// MARK: - Decodable

extension Region: Decodable {

    private enum CodingKeys: String, CodingKey {

        case name
        case slug
        case shortName  = "short_name"

    }

}
