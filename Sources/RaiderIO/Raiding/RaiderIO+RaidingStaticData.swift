//
//  RaiderIO+RaidingStaticData.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation

extension RaiderIO {

    private static let raidingStaticDataPath = "/v1/raiding/static-data"

    /// Retrieve raid and boss static data for a specific expansion (slugs, names, etc.).
    ///
    /// - Parameter expansion: Expansion to get slugs for.
    public func getStaticRaidingData(for expansion: Expansion) async throws -> StaticRaidingData {
        let raidingStaticDataUrl = baseUrl.appendingPathComponent(Self.raidingStaticDataPath)
        guard var urlComponents = URLComponents(url: raidingStaticDataUrl, resolvingAgainstBaseURL: true) else {
            throw RaiderIOError.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "expansion_id", value: "\(expansion.rawValue)")
        ]

        guard let url = urlComponents.url else {
            throw RaiderIOError.invalidUrlParameters
        }

        return try await request(url: url)
    }

}
