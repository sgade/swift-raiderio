//
//  RaiderIO+RaidingHallOfFame.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//


import Foundation


extension RaiderIO {

    private struct HallOfFameResponse: Decodable {

        public let hallOfFame: HallOfFame

    }

    private static let raidingHallOfFameUrl = URL(string: "https://raider.io/api/v1/raiding/hall-of-fame")!

    public func getRaidingHallOfFame(raid raidSlug: String, difficulty: Difficulty, region: RegionSlug) async throws -> HallOfFame {
        guard var urlComponents = URLComponents(url: RaiderIO.raidingHallOfFameUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "raid", value: raidSlug),
            URLQueryItem(name: "difficulty", value: difficulty.rawValue),
            URLQueryItem(name: "region", value: region.rawValue)
        ]

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        let response: HallOfFameResponse = try await request(url: url)
        return response.hallOfFame
    }

}
