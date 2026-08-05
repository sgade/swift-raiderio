//
//  RaiderIO+RaidingRankings.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//

import Foundation
import RaiderIOAPI

extension RaiderIO {

    /// Retrieve the raid rankings for a given raid and region.
    ///
    /// - Parameters:
    ///     - raid: Raid to look up. This is the raid's name in slug form: `"tomb-of-sargeras"`.
    ///     - difficulty: Difficulty to restrict progress to.
    ///     - region: Name of region to restrict progress to.
    ///               Can be a primary region: `world`, `us`, `eu`, `kr`, `tw`.
    ///               Or a subregion: `english`, `french`, `german`, `italian`, `oceanic`, `russian`, `spanish`,
    ///               `eu-english`, `eu-portuguese`, `eu-spanish`, `us-english`, `brazil`, `us-spanish`, `us-central`,
    ///               `us-eastern`, `us-mountain`, `us-pacific`.
    ///     - realm: Name of realm to restrict to.
    ///              Prefix with `connected-` to retrieve rankings from the connected realm. Requires that region be a
    ///              standard region: `us`, `eu`, `kr`, `tw`.
    ///     - guilds: Guild IDs of guilds to restrict the results to. Allows filtering to up to 10 different guilds.
    public func getRaidRankings(
        raid: RaidSlug,
        difficulty: Difficulty,
        region: SubRegionSlug,
        realm: String? = nil,
        guilds guildIds: [Int] = []
    ) async throws -> [RaidRanking] {
        let guildsValue: String? = if !guildIds.isEmpty {
            guildIds.map({ "\($0)" }).joined(separator: ",")
        } else {
            nil
        }

        switch try await client.getApiV1RaidingRaidrankings(query: .init(
            raid: try convert(from: raid),
            difficulty: try convert(from: difficulty),
            region: region.rawValue,
            realm: realm,
            guilds: guildsValue
        )) {
        case .ok(let ok):
            return try (ok.body.json.raidRankings ?? []).map(RaidRanking.init)
        case .undocumented(let statusCode, _):
            throw RaiderIOError.http(statusCode: statusCode)
        }
    }

}
