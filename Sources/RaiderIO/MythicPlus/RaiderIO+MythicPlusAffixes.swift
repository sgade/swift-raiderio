//
//  RaiderIO+MythicPlusAffixes.swift
//  RaiderIO
//
//  Created by Sören Gade on 23.02.22.
//

import Foundation

extension RaiderIO {

    private static let mythicPlusAffixesPath = "/v1/mythic-plus/affixes"

    /// Retrieve the affixes for a specific region, including the latest run seen with this affix.
    ///
    /// - Parameters:
    ///     - region: Name of region to look up affixes for.
    ///     - locale: Language to return name and description of affixes in.
    public func getMythicPlusAffixes(region: RegionSlug, locale: Locale) async throws -> Affixes {
        let mythicPlusAffixesUrl = baseUrl.appendingPathComponent(Self.mythicPlusAffixesPath)
        guard var urlComponents = URLComponents(url: mythicPlusAffixesUrl, resolvingAgainstBaseURL: true) else {
            throw RaiderIOError.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "region", value: region.rawValue),
            URLQueryItem(name: "locale", value: locale.rawValue)
        ]

        guard let url = urlComponents.url else {
            throw RaiderIOError.invalidUrlParameters
        }

        return try await request(url: url)
    }

}
