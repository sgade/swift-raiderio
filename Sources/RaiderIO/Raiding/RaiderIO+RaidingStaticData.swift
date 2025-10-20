//
//  RaiderIO+RaidingStaticData.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation

extension RaiderIO {

    /// Retrieve raid and boss static data for a specific expansion (slugs, names, etc.).
    ///
    /// - Parameter expansion: Expansion to get slugs for.
    public func getStaticRaidingData(for expansion: Expansion) async throws -> StaticRaidingData {
        try await parse {
            try await client.getApiV1RaidingStaticdata(query: .init(expansionId: expansion.rawValue))
                .default.body.any
        }
    }

}
