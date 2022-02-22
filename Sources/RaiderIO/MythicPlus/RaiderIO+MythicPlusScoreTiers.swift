//
//  RaiderIO+MythicPlusScoreTiers.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//


import Foundation


extension RaiderIO {

    private static let mythicPlusScoreTiersUrl = URL(string: "https://raider.io/api/v1/mythic-plus/score-tiers")!

    public func getMythicPlusScoreTiers(for season: String) async throws -> [ScoreTier] {
        guard var urlComponents = URLComponents(url: RaiderIO.mythicPlusScoreTiersUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "season", value: season)
        ]

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        return try await request(url: url)
    }

}
