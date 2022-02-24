//
//  RaiderIO+RaidingProgression.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//


import Foundation


extension RaiderIO {

    private struct RaidingProgressionResponse: Decodable {

        public let progression: [RaidProgressionEntry]

    }

    private static let raidingRaidingProgressionUrl = URL(string: "https://raider.io/api/v1/raiding/progression")!

    public func getRaidingProgression(raid raidSlug: String,
                                      difficulty: Difficulty,
                                      region: RegionSlug) async throws -> [RaidProgressionEntry] {
        guard var urlComponents = URLComponents(url: RaiderIO.raidingRaidingProgressionUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "raid", value: raidSlug),
            URLQueryItem(name: "difficulty", value: difficulty.rawValue),
            URLQueryItem(name: "region", value: region.rawValue)
        ]

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        let response: RaidingProgressionResponse = try await request(url: url)
        return response.progression
    }

}
