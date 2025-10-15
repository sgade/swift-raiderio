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
        let region = try produce {
            Operations.getApiV1GuildsBosskill.Input.Query.regionPayload(rawValue: region.rawValue)
        }

        let raid = try produce {
            Operations.getApiV1GuildsBosskill.Input.Query.raidPayload(rawValue: raid.rawValue)
        }

        let difficulty = try produce {
            Operations.getApiV1GuildsBosskill.Input.Query.difficultyPayload(rawValue: difficulty.rawValue)
        }

        do {
            return try await parse {
                try await client.getApiV1GuildsBosskill(query: .init(
                    region: region,
                    realm: realm,
                    guild: guildName,
                    raid: raid,
                    boss: bossSlug,
                    difficulty: difficulty
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
