//
//  BossRanking+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension BossRanking {

    init(_ apiModel: Components.Schemas.BossRankingEntry) throws {
        guard let guild = apiModel.guild, let rank = apiModel.rank else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            rank: rank,
            regionRank: apiModel.regionRank,
            guild: try Guild(guild),
            encountersDefeated: try (apiModel.encountersDefeated ?? []).map(DefeatedEncounter.init),
            streamers: try apiModel.streamers.map(Streamers.init),
            recruitmentProfiles: try apiModel.recruitmentProfiles.map { try $0.map(RecruitmentProfile.init) },
            itemLevelAvg: apiModel.itemLevelAvg.map(Float.init)
        )
    }

}
