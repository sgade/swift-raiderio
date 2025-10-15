//
//  RaiderIO+MythicPlusAffixes.swift
//  RaiderIO
//
//  Created by Sören Gade on 23.02.22.
//

import Foundation

extension RaiderIO {

    /// Retrieve the affixes for a specific region, including the latest run seen with this affix.
    ///
    /// - Parameters:
    ///     - region: Name of region to look up affixes for.
    ///     - locale: Language to return name and description of affixes in.
    public func getMythicPlusAffixes(
        region: RegionSlug,
        locale: Locale
    ) async throws -> Affixes {
        try await parse {
            try await client.getApiV1MythicplusAffixes(query: .init(
                region: try convert(from: region),
                locale: try convert(from: locale)
            )).ok.body.any
        }
    }

}
