//
//  RaiderIO+MythicPlusScoreTiers.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation

extension RaiderIO {

    private static let mythicPlusScoreTiersPath = "/v1/mythic-plus/score-tiers"

    /// Retrieve the colors used for score tiers in the given season.
    ///
    /// - Parameters:
    ///     - season: Name of the season to retrieve (`season-bfa-1`, etc.). Defaults to current season.
    public func getMythicPlusScoreTiers(for season: String) async throws -> [ScoreTier] {
        let mythicPlusScoreTiersUrl = baseUrl.appendingPathComponent(Self.mythicPlusScoreTiersPath)
        guard var urlComponents = URLComponents(url: mythicPlusScoreTiersUrl, resolvingAgainstBaseURL: true) else {
            throw RaiderIOError.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "season", value: season)
        ]

        guard let url = urlComponents.url else {
            throw RaiderIOError.invalidUrlParameters
        }

        return try await request(url: url)
    }

}
