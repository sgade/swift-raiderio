//
//  RaiderIO+MythicPlusLeaderboardCapacity.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//


import Foundation


extension RaiderIO {

    public enum RelativeWeek: String {

        case current
        case previous

    }

    private struct LeaderboardCapacityResponse: Decodable {

        public let realmListing: LeaderboardCapacity

    }

    private static let mythicPlusLeaderboardCapacityUrl = URL(string: "https://raider.io/api/v1/mythic-plus/leaderboard-capacity")!

    public func getMythicPlusLeaderboardCapacity(for week: RelativeWeek, region: RegionSlug, realm: String? = nil) async throws -> LeaderboardCapacity {
        guard var urlComponents = URLComponents(url: RaiderIO.mythicPlusLeaderboardCapacityUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "scope", value: week.rawValue),
            URLQueryItem(name: "region", value: region.rawValue)
        ]
        if let realm = realm {
            urlComponents.queryItems?.append(URLQueryItem(name: "realm", value: realm))
        }

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        let response: LeaderboardCapacityResponse = try await request(url: url)
        return response.realmListing
    }

}
