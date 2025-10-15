//
//  RaiderIO+MythicPlusSeasonCutoffs.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation

extension RaiderIO {

    private struct SeasonCutoffsReponse: Decodable {

        public let cutoffs: SeasonCutoffs

    }

    /// Retrieve the Mythic+ Season cutoffs for a region.
    ///
    /// - Parameters:
    ///     - season: Season to retrieve cutoffs for.
    ///     - region: Region to receive cutoffs for.
    public func getMythicPlusSeasonCutoffs(for season: String, in region: RegionSlug) async throws -> SeasonCutoffs {
        let response: SeasonCutoffsReponse = try await parse {
            try await client.getApiV1MythicplusSeasoncutoffs(query: .init(
                season: season,
                region: try convert(from: region)
            )).default.body.any
        }
        return response.cutoffs
    }

}
