//
//  RaiderIO+MythicPlusSeasonCutoffs.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation

extension RaiderIO {

    /// Retrieve the Mythic+ Season cutoffs for a region.
    ///
    /// - Parameters:
    ///     - season: Season to retrieve cutoffs for.
    ///     - region: Region to receive cutoffs for.
    public func getMythicPlusSeasonCutoffs(for season: String, in region: RegionSlug) async throws -> SeasonCutoffs {
        switch try await client.getApiV1MythicplusSeasoncutoffs(query: .init(
            season: season,
            region: try convert(from: region)
        )) {
        case .ok(let ok):
            let json = try ok.body.json
            guard let cutoffs = json.cutoffs, let ui = json.ui else {
                throw RaiderIOError.typeConversionFailure
            }
            return try SeasonCutoffs(cutoffs: cutoffs, ui: ui)
        case .undocumented(let statusCode, _):
            throw RaiderIOError.http(statusCode: statusCode)
        }
    }

}
