//
//  RaiderIO+RaidingRankings.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//

import Foundation

extension RaiderIO {

    private struct RaidRankingsResponse: Decodable {

        public let raidRankings: [RaidRanking]

    }

    private static let raidRankingsPath = "/v1/raiding/raid-rankings"

    /// Retrieve the raid rankings for a given raid and region.
    ///
    /// - Parameters:
    ///     - raid: Raid to look up. This is the raid's name in slug form: `"tomb-of-sargeras"`.
    ///     - difficulty: Difficulty to restrict progress to.
    ///     - region: Name of region to restrict progress to.
    ///               Can be a primary region: `world`, `us`, `eu`, `kr`, `tw`.
    ///               Or a subregion: `english`, `french`, `german`, `italian`, `oceanic`, `russian`, `spanish`,
    ///               `eu-english`, `eu-portuguese`, `eu-spanish`, `us-english`, `brazil`, `us-spanish`, `us-central`,
    ///               `us-eastern`, `us-mountain`, `us-pacific`.
    ///     - realm: Name of realm to restrict to.
    ///              Prefix with `connected-` to retrieve rankings from the connected realm. Requires that region be a
    ///              standard region: `us`, `eu`, `kr`, `tw`.
    ///     - guilds: Guild IDs of guilds to restrict the results to. Allows filtering to up to 10 different guilds.
    public func getRaidRankings(raid: RaidSlug,
                                difficulty: Difficulty,
                                region: SubRegionSlug,
                                realm: String? = nil,
                                guilds guildIds: [Int] = []) async throws -> [RaidRanking] {
        let raidRankingsUrl = baseUrl.appendingPathComponent(Self.raidRankingsPath)
        guard var urlComponents = URLComponents(url: raidRankingsUrl, resolvingAgainstBaseURL: true) else {
            throw RaiderIOError.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "raid", value: raid.rawValue),
            URLQueryItem(name: "difficulty", value: difficulty.rawValue),
            URLQueryItem(name: "region", value: region.rawValue)
        ]
        if let realm = realm {
            urlComponents.queryItems?.append(URLQueryItem(name: "realm", value: realm))
        }
        if !guildIds.isEmpty {
            let guildsValue = guildIds.map({ "\($0)" }).joined(separator: ",")
            urlComponents.queryItems?.append(URLQueryItem(name: "guilds", value: guildsValue))
        }

        guard let url = urlComponents.url else {
            throw RaiderIOError.invalidUrlParameters
        }

        let response: RaidRankingsResponse = try await request(url: url)
        return response.raidRankings
    }

}
