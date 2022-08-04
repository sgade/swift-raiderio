//
//  RaiderIO+MythicPlusLeaderboardCapacity.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation

extension RaiderIO {

    public enum RelativeWeek: String {

        case current
        case previous

    }

    private struct LeaderboardCapacityResponse: Decodable {

        public let realmListing: LeaderboardCapacity

    }

    private static let mythicPlusLeaderboardCapacityPath = "/v1/mythic-plus/leaderboard-capacity"

    /// Retrieve the leaderboard capacity for a region including lowest level and time to qualify.
    ///
    /// - Parameters:
    ///     - week: Retrieve the capacity info for the current or previous week.
    ///     - region: Name of region to retrieve runs for.
    ///     - realm: Name of realm to retrieve runs for.
    public func getMythicPlusLeaderboardCapacity(for week: RelativeWeek,
                                                 region: RegionSlug,
                                                 realm: String? = nil) async throws -> LeaderboardCapacity {
        let mythicPlusLeaderboardCapacityUrl = baseUrl.appendingPathComponent(Self.mythicPlusLeaderboardCapacityPath)
        guard var urlComponents = URLComponents(url: mythicPlusLeaderboardCapacityUrl,
                                                resolvingAgainstBaseURL: true) else {
            throw RaiderIOError.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "scope", value: week.rawValue),
            URLQueryItem(name: "region", value: region.rawValue)
        ]
        if let realm = realm {
            urlComponents.queryItems?.append(URLQueryItem(name: "realm", value: realm))
        }

        guard let url = urlComponents.url else {
            throw RaiderIOError.invalidUrlParameters
        }

        let response: LeaderboardCapacityResponse = try await request(url: url)
        return response.realmListing
    }

}
