//
//  RaiderIO+BossKill.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation
import RaiderIOAPI

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
        switch try await client.getApiV1GuildsBosskill(query: .init(
            region: try convert(from: region),
            realm: realm,
            guild: guildName,
            raid: try convert(from: raid),
            boss: bossSlug,
            difficulty: try convert(from: difficulty)
        )) {
        case .ok(let ok):
            let json = try ok.body.json
            // The API returns an empty object when there's no kill recorded for this boss.
            guard let kill = json.kill else { return nil }
            let roster: Components.Schemas.Roster = json.roster ?? []
            return try BossKill(kill: kill, roster: roster)
        case .undocumented(let statusCode, _):
            throw RaiderIOError.http(statusCode: statusCode)
        }
    }
    // swiftlint:enable function_parameter_count

}
