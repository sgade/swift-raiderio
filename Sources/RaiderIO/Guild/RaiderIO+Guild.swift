//
//  RaiderIO+Guild.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//


import Foundation


public enum GuildProfileField: String, CaseIterable {

    case raidProgression    = "raid_progression"
    case raidRankings       = "raid_rankings"

}



extension RaiderIO {

    private static let guildProfileUrl = URL(string: "https://raider.io/api/v1/guilds/profile")!

    public func getGuildProfile(region: Region,
                                realm: String,
                                name: String,
                                fields: [GuildProfileField] = []) async throws -> GuildProfile {
        guard var urlComponents = URLComponents(url: RaiderIO.guildProfileUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "region", value: region.rawValue),
            URLQueryItem(name: "realm", value: realm),
            URLQueryItem(name: "name", value: name)
        ]
        if fields.count > 0 {
            urlComponents.queryItems?.append(URLQueryItem(name: "fields", value: fields.map({ $0.rawValue }).joined(separator: ",")))
        }

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        return try await request(url: url)
    }

}
