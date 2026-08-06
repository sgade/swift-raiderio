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
        switch try await client.getApiV1MythicplusScoretiers(
            query: .init(
                season: season
            ))
        {
        case .ok(let ok):
            return try ok.body.json.map(ScoreTier.init)
        case .undocumented(let statusCode, _):
            throw RaiderIOError.http(statusCode: statusCode)
        }
    }

}
