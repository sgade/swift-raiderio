//
//  Affixes.swift
//  RaiderIO
//
//  Created by Sören Gade on 23.02.22.
//


import Foundation


public struct Affixes {

    public let region: RegionSlug
    public let title: String
    public let leaderboardUrl: URL
    public let affixDetails: [Affix]

}

// MARK: - Codable

extension Affixes: Codable {

    private enum CodingKeys: String, CodingKey {

        case region
        case title
        case leaderboardUrl = "leaderboard_url"
        case affixDetails   = "affix_details"

    }

}
