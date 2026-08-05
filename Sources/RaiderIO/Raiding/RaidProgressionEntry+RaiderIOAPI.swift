//
//  RaidProgressionEntry+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension RaidProgressionEntry {

    init(_ apiModel: Components.Schemas.RaidRaceProgressionEntry) throws {
        self.init(
            progress: apiModel.progress,
            totalGuilds: apiModel.totalGuilds,
            guilds: try (apiModel.guilds ?? []).map(KillGuild.init)
        )
    }

}

extension KillGuild {

    /// Backs `RaidRaceProgressionEntry.guilds` - only `guild`/`defeatedAt` are available at this
    /// position (no `rank`/`encountersDefeated`, unlike the `DefeatedBy`/`AttemptedBy` positions).
    init(_ apiModel: Components.Schemas.GuildDefeatEntry) throws {
        guard let guild = apiModel.guild else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(guild: try Guild(guild), defeatedAt: try ISO8601Date(string: apiModel.defeatedAt))
    }

}
