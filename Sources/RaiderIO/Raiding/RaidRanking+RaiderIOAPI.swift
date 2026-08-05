//
//  RaidRanking+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension RaidRanking {

    init(_ apiModel: Components.Schemas.RaidRankingEntry) throws {
        guard let guild = apiModel.guild, let rank = apiModel.rank else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            rank: rank,
            regionRank: apiModel.regionRank,
            guild: try Guild(guild),
            encountersDefeated: try (apiModel.encountersDefeated ?? []).map(DefeatedEncounter.init)
        )
    }

}
