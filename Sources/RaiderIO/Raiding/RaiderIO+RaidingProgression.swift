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

    private static let raidingProgressionPath = "/v1/raiding/progression"

    /// Retrieve details of raiding progression for a raid.
    ///
    /// - Parameters:
    ///     - raid: Raid to look up. This is the raid's name in slug form: `"tomb-of-sargeras"`.
    ///     - difficulty: Difficulty to restrict progress to.
    ///     - region: Name of region to restrict progress to.
    public func getRaidingProgression(raid: RaidSlug,
                                      difficulty: Difficulty,
                                      region: RegionSlug) async throws -> [RaidProgressionEntry] {
        let raidingProgressionUrl = baseUrl.appendingPathComponent(Self.raidingProgressionPath)
        guard var urlComponents = URLComponents(url: raidingProgressionUrl, resolvingAgainstBaseURL: true) else {
            throw RaiderIOError.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "raid", value: raid.rawValue),
            URLQueryItem(name: "difficulty", value: difficulty.rawValue),
            URLQueryItem(name: "region", value: region.rawValue)
        ]

        guard let url = urlComponents.url else {
            throw RaiderIOError.invalidUrlParameters
        }

        let response: RaidingProgressionResponse = try await request(url: url)
        return response.progression
    }

}
