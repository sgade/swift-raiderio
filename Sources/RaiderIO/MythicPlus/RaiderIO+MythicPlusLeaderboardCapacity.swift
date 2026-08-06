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

    /// Retrieve the leaderboard capacity for a region including lowest level and time to qualify.
    ///
    /// - Parameters:
    ///     - week: Retrieve the capacity info for the current or previous week.
    ///     - region: Name of region to retrieve runs for.
    ///     - realm: Name of realm to retrieve runs for.
    public func getMythicPlusLeaderboardCapacity(
        for week: RelativeWeek,
        region: RegionSlug,
        realm: String? = nil
    ) async throws -> LeaderboardCapacity {
        switch try await client.getApiV1MythicplusLeaderboardcapacity(
            query: .init(
                scope: try convert(from: week),
                region: try convert(from: region),
                realm: realm
            ))
        {
        case .ok(let ok):
            guard let realmListing = try ok.body.json.realmListing else {
                throw RaiderIOError.typeConversionFailure
            }
            return try LeaderboardCapacity(realmListing)
        case .undocumented(let statusCode, _):
            throw RaiderIOError.http(statusCode: statusCode)
        }
    }

}
