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

    private static let mythicPlusSeasonCutoffsPath = "/v1/mythic-plus/season-cutoffs"

    /// Retrieve the Mythic+ Season cutoffs for a region.
    ///
    /// - Parameters:
    ///     - season: Season to retrieve cutoffs for.
    ///     - region: Region to receive cutoffs for.
    public func getMythicPlusSeasonCutoffs(for season: String, in region: RegionSlug) async throws -> SeasonCutoffs {
        let mythicPlusSeasonCutoffsUrl = baseUrl.appendingPathComponent(Self.mythicPlusSeasonCutoffsPath)
        guard var urlComponents = URLComponents(url: mythicPlusSeasonCutoffsUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "season", value: season),
            URLQueryItem(name: "region", value: region.rawValue)
        ]

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        let response: SeasonCutoffsReponse = try await request(url: url)
        return response.cutoffs
    }

}
