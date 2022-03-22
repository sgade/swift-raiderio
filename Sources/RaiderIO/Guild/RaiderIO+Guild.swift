//
//  RaiderIO+Guild.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//


import Foundation


public enum GuildProfileField: String, CaseIterable {

    /// Retrieve raid progression data for guild.
    case raidProgression    = "raid_progression"

    /// Retrieve raid rankings data for guild.
    case raidRankings       = "raid_rankings"

}


extension RaiderIO {

    private static let guildProfilePath = "/v1/guilds/profile"

    /// Retrieve information about a guild.
    ///
    /// - Parameters:
    ///     - region: Name of region to look up guild in.
    ///     - realm: Name of realm that guild is on. This is in slug format, e.g. `"altar-of-storms"`.
    ///     - name: Name of the guild to look up. This is not case sensitive.
    ///     - fields: List of fields to retrieve for this guild.
    public func getGuildProfile(region: RegionSlug,
                                realm: String,
                                name: String,
                                fields: [GuildProfileField] = []) async throws -> GuildProfile {
        let guildProfileUrl = baseUrl.appendingPathComponent(Self.guildProfilePath)
        guard var urlComponents = URLComponents(url: guildProfileUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "region", value: region.rawValue),
            URLQueryItem(name: "realm", value: realm),
            URLQueryItem(name: "name", value: name)
        ]
        if fields.count > 0 {
            let fieldsValue = fields.map({ $0.rawValue }).joined(separator: ",")
            urlComponents.queryItems?.append(URLQueryItem(name: "fields", value: fieldsValue))
        }

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        return try await request(url: url)
    }

}
