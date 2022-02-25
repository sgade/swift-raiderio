//
//  RaiderIO+RaidingBossRankings.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//


import Foundation


extension RaiderIO {

    private struct BossRankingsResponse: Decodable {

        public let bossRankings: [BossRanking]

    }

    private static let raidingBossRankingsUrl = URL(string: "https://raider.io/api/v1/raiding/boss-rankings")!

    /// Retrieve the boss rankings for a given raid and region.
    ///
    /// - Parameters:
    ///     - raid: Raid to look up. This is the name in slug form: `"tomb-of-sargeras"`.
    ///     - boss: Slug of boss to look up.
    ///     - difficulty: The difficulty to look up.
    ///     - region: Name of region to restrict progress to.
    ///               Can be a primary region: `world`, `us`, `eu`, `kr`, `tw`.
    ///               Or a subregion: `english`, `french`, `german`, `italian`, `oceanic`, `russian`, `spanish`, `eu-english`, `eu-portuguese`, `eu-spanish`, `us-english`, `brazil`, `us-spanish`, `us-central`, `us-eastern`, `us-mountain`, `us-pacific`.
    ///     - realm: Name of realm to restrict to.
    ///              Prefix with `connected-` to retrieve rankings from the connected realm. Requires that region be a standard region: `us`, `eu`, `kr`, `tw`.
    public func getRaidingBossRankings(raid: RaidSlug,
                                       boss bossSlug: String,
                                       difficulty: Difficulty,
                                       region: SubRegionSlug,
                                       realm: String? = nil) async throws -> [BossRanking] {
        guard var urlComponents = URLComponents(url: RaiderIO.raidingBossRankingsUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "raid", value: raid.rawValue),
            URLQueryItem(name: "boss", value: bossSlug),
            URLQueryItem(name: "difficulty", value: difficulty.rawValue),
            URLQueryItem(name: "region", value: region.rawValue)
        ]
        if let realm = realm {
            urlComponents.queryItems?.append(URLQueryItem(name: "realm", value: realm))
        }

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        let response: BossRankingsResponse = try await request(url: url)
        return response.bossRankings
    }

}
