//
//  RaiderIO+RaidingBossRankings.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//

import Foundation

extension RaiderIO {

    /// Retrieve the boss rankings for a given raid and region.
    ///
    /// - Parameters:
    ///     - raid: Raid to look up. This is the name in slug form: `"tomb-of-sargeras"`.
    ///     - boss: Slug of boss to look up.
    ///     - difficulty: The difficulty to look up.
    ///     - region: Name of region to restrict progress to.
    ///               Can be a primary region: `world`, `us`, `eu`, `kr`, `tw`.
    ///               Or a subregion: `english`, `french`, `german`, `italian`, `oceanic`, `russian`, `spanish`,
    ///                `eu-english`, `eu-portuguese`, `eu-spanish`, `us-english`, `brazil`, `us-spanish`, `us-central`,
    ///                `us-eastern`, `us-mountain`, `us-pacific`.
    ///     - realm: Name of realm to restrict to.
    ///              Prefix with `connected-` to retrieve rankings from the connected realm. Requires that region be a
    ///              standard region: `us`, `eu`, `kr`, `tw`.
    public func getRaidingBossRankings(
        raid: RaidSlug,
        boss bossSlug: String,
        difficulty: Difficulty,
        region: SubRegionSlug,
        realm: String? = nil
    ) async throws -> [BossRanking] {
        switch try await client.getApiV1RaidingBossrankings(query: .init(
            raid: try convert(from: raid),
            boss: bossSlug,
            difficulty: try convert(from: difficulty),
            region: region.rawValue,
            realm: realm
        )) {
        case .ok(let ok):
            return try (ok.body.json.bossRankings ?? []).map(BossRanking.init)
        case .undocumented(let statusCode, _):
            throw RaiderIOError.http(statusCode: statusCode)
        }
    }

}
