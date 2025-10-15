//
//  RaiderIO+BossKill.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation

extension RaiderIO {

    // swiftlint:disable function_parameter_count
    /// Retrieve information about a guild boss kill.
    ///
    /// - Parameters:
    ///     - region: Name of region to look up guild in.
    ///     - realm: Name of realm that guild is on. This is in slug format, e.g. `"altar-of-storms"`.
    ///     - guild: Name of the guild to look up. This is not case sensitive.
    ///     - raid: Raid slug to look up.
    ///     - boss: Boss slug to look up.
    ///     - difficulty: Raid difficulty to look up.
    public func getGuildBossKill(
        region: RegionSlug,
        realm: String,
        guildName: String,
        raid: RaidSlug,
        boss bossSlug: String,
        difficulty: Difficulty
    ) async throws -> BossKill? {
        do {
            return try await parse {
                try await client.getApiV1GuildsBosskill(query: .init(
                    region: try convert(from: region),
                    realm: realm,
                    guild: guildName,
                    raid: try convert(from: raid),
                    boss: bossSlug,
                    difficulty: try convert(from: difficulty)
                )).default.body.any
            }
        } catch DecodingError.keyNotFound(let codingKey, let context) {
            // when there is no kill recorded, we get back an empty object
            guard (codingKey.stringValue == "kill" || codingKey.stringValue == "roster"),
                  context.codingPath.isEmpty
            else {
                throw DecodingError.keyNotFound(codingKey, context)
            }

            return nil
        }
    }
    // swiftlint:enable function_parameter_count

}
