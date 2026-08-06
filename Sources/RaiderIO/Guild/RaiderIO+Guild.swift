//
//  RaiderIO+Guild.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation

public enum GuildProfileField: String, CaseIterable {

    /// Retrieve raid progression data for guild.
    case raidProgression = "raid_progression"

    /// Retrieve raid rankings data for guild.
    case raidRankings = "raid_rankings"

}

extension RaiderIO {

    /// Retrieve information about a guild.
    ///
    /// - Parameters:
    ///     - region: Name of region to look up guild in.
    ///     - realm: Name of realm that guild is on. This is in slug format, e.g. `"altar-of-storms"`.
    ///     - name: Name of the guild to look up. This is not case sensitive.
    ///     - fields: List of fields to retrieve for this guild.
    public func getGuildProfile(
        region: RegionSlug,
        realm: String,
        name: String,
        fields: [GuildProfileField] = []
    ) async throws -> GuildProfile {
        let fieldsValue: String? =
            if fields.count > 0 {
                fields.map({ $0.rawValue }).joined(separator: ",")
            } else {
                nil
            }

        switch try await client.getApiV1GuildsProfile(
            query: .init(
                region: try convert(from: region),
                realm: realm,
                name: name,
                fields: fieldsValue
            ))
        {
        case .ok(let ok):
            return try GuildProfile(ok.body.json)
        case .undocumented(let statusCode, _):
            throw RaiderIOError.http(statusCode: statusCode)
        }
    }

}
