//
//  RaiderIO+RaidingStaticData.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//


import Foundation


extension RaiderIO {

    private static let raidingStaticDataUrl = URL(string: "https://raider.io/api/v1/raiding/static-data")!

    /// Retrieve raid and boss static data for a specific expansion (slugs, names, etc.).
    ///
    /// - Parameter expansion: Expansion to get slugs for.
    public func getStaticRaidingData(for expansion: Expansion) async throws -> StaticRaidingData {
        guard var urlComponents = URLComponents(url: RaiderIO.raidingStaticDataUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "expansion_id", value: "\(expansion.rawValue)")
        ]

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        return try await request(url: url)
    }

}
