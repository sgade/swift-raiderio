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

    private static let raidRankingsUrl = URL(string: "https://raider.io/api/v1/raiding/raid-rankings")!

    public func getRaidRankings(raid raidSlug: String,
                                difficulty: Difficulty,
                                region: RegionSlug,
                                realm: String? = nil,
                                guilds guildIds: [Int] = []) async throws -> [RaidRanking] {
        guard var urlComponents = URLComponents(url: RaiderIO.raidRankingsUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "raid", value: raidSlug),
            URLQueryItem(name: "difficulty", value: difficulty.rawValue),
            URLQueryItem(name: "region", value: region.rawValue)
        ]
        if let realm = realm {
            urlComponents.queryItems?.append(URLQueryItem(name: "realm", value: realm))
        }
        if !guildIds.isEmpty {
            urlComponents.queryItems?.append(URLQueryItem(name: "guilds", value: guildIds.map({ "\($0)" }).joined(separator: ",") ))
        }

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        let response: RaidRankingsResponse = try await request(url: url)
        return response.raidRankings
    }

}
