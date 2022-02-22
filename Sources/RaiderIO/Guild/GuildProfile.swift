//
//  GuildProfile.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//


import Foundation


public struct GuildProfile {

    public let name: String
    public let faction: Faction
    public let region: RegionSlug
    public let realm: String
    public let profileUrl: URL

    public let raidRankings: [String: RaidRanking]?
    public let raidProgression: [String: RaidProgression]?

}

// MARK: - Decodable

extension GuildProfile: Decodable {

    private enum CodingKeys: String, CodingKey {

        case name
        case faction
        case region
        case realm
        case profileUrl         = "profile_url"

        case raidRankings       = "raid_rankings"
        case raidProgression    = "raid_progression"

    }

}
