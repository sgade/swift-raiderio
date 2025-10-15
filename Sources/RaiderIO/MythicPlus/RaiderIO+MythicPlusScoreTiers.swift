//
//  RaiderIO+MythicPlusScoreTiers.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation

extension RaiderIO {

    /// Retrieve the colors used for score tiers in the given season.
    ///
    /// - Parameters:
    ///     - season: Name of the season to retrieve (`season-bfa-1`, etc.). Defaults to current season.
    public func getMythicPlusScoreTiers(for season: String) async throws -> [ScoreTier] {
        try await parse {
            try await client.getApiV1MythicplusScoretiers(query: .init(
                season: season
            )).default.body.any
        }
    }

}
