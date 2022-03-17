//
//  RaiderIO+MythicPlusStaticData.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


extension RaiderIO {

    private static let mythicPlusStaticDataPath = "/v1/mythic-plus/static-data"

    /// Retrieve mythic plus season and dungeon static data for a specific expansion (slugs, names, etc.).
    ///
    /// - Parameters:
    ///     - expansion: Expansion to get slugs for.
    public func getStaticMythicPlusData(for expansion: Expansion) async throws -> StaticMythicPlusData {
        let mythicPlusStaticDataUrl = baseUrl.appendingPathComponent(Self.mythicPlusStaticDataPath)
        guard var urlComponents = URLComponents(url: mythicPlusStaticDataUrl, resolvingAgainstBaseURL: true) else {
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
