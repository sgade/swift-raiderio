//
//  MythicPlusRuns+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import Foundation
import RaiderIOAPI

extension MythicPlusRuns {

    init(_ apiModel: Components.Schemas.ViewMythicPlusRunsResponse) throws {
        guard let leaderboardUrl = apiModel.leaderboardUrl.flatMap(URL.init(string:)),
              let params = apiModel.params
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            rankings: try (apiModel.rankings ?? []).map(MythicPlusRanking.init),
            leaderboardUrl: leaderboardUrl,
            parameters: try Parameters(params)
        )
    }

}

extension MythicPlusRuns.Parameters {

    init(_ apiModel: Components.Schemas.Params) throws {
        guard let season = apiModel.season,
              let region = apiModel.region,
              let dungeon = apiModel.dungeon,
              let page = apiModel.page
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(season: season, region: RegionSlug(rawValue: region), dungeon: dungeon, page: page)
    }

}

extension MythicPlusRanking {

    init(_ apiModel: Components.Schemas.RankedRun) throws {
        guard let rank = apiModel.rank, let score = apiModel.score, let run = apiModel.run else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(rank: rank, score: MythicPlusScore(score), run: try Run(run))
    }

}

extension MythicPlusRanking.Run {

    init(_ apiModel: Components.Schemas.RankedRunDetail) throws {
        guard let season = apiModel.season,
              let keystoneRunId = apiModel.keystoneRunId,
              let keystoneTeamId = apiModel.keystoneTeamId,
              let mythicLevel = apiModel.mythicLevel,
              let clearTimeMs = apiModel.clearTimeMs,
              let keystoneTimeMs = apiModel.keystoneTimeMs,
              let completedAt = apiModel.completedAt,
              let numChests = apiModel.numChests,
              let timeRemainingMs = apiModel.timeRemainingMs,
              let faction = apiModel.faction,
              let numModifiersActive = apiModel.numModifiersActive
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            season: season,
            keystoneRunId: keystoneRunId,
            keystoneTeamId: keystoneTeamId,
            keystonePlatoonId: apiModel.keystonePlatoonId,
            mythicLevel: mythicLevel,
            clearTime: Milliseconds(duration: Double(clearTimeMs) / 1000.0),
            keystoneTime: Milliseconds(duration: Double(keystoneTimeMs) / 1000.0),
            completedAt: try ISO8601Date(string: completedAt),
            numberOfChests: numChests,
            timeRemaining: Milliseconds(duration: Double(timeRemainingMs) / 1000.0),
            faction: try Faction(string: faction),
            weeklyModifiers: try (apiModel.weeklyModifiers ?? []).map(Affix.init),
            numberOfActiveModifiers: numModifiersActive
        )
    }

}
