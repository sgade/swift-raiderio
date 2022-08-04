//
//  GuildProfile.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation

public struct GuildProfile {

    public struct RaidRanking {

        public let normal: Ranks
        public let heroic: Ranks
        public let mythic: Ranks

        public init(normal: Ranks, heroic: Ranks, mythic: Ranks) {
            self.normal = normal
            self.heroic = heroic
            self.mythic = mythic
        }

    }

    public let name: String
    public let faction: Faction
    public let region: RegionSlug
    public let realm: String
    public let profileUrl: URL

    public let raidRankings: [String: RaidRanking]?
    public let raidProgression: [String: RaidProgression]?

    public init(name: String,
                faction: Faction,
                region: RegionSlug,
                realm: String,
                profileUrl: URL,
                raidRankings: [String: RaidRanking]? = nil,
                raidProgression: [String: RaidProgression]?) {
        self.name = name
        self.faction = faction
        self.region = region
        self.realm = realm
        self.profileUrl = profileUrl
        self.raidRankings = raidRankings
        self.raidProgression = raidProgression
    }

}

// MARK: - Codable

extension GuildProfile: Codable {

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

extension GuildProfile.RaidRanking: Codable {}
