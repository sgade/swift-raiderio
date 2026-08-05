//
//  DungeonRun+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import Foundation
import RaiderIOAPI

extension DungeonRun {

    init(_ apiModel: Components.Schemas.KeystoneRun) throws {
        guard let url = URL(string: apiModel.url) else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            dungeon: apiModel.dungeon,
            shortName: apiModel.shortName,
            mythicLevel: apiModel.mythicLevel,
            completedAt: ISO8601Date(apiModel.completedAt),
            clearTime: Milliseconds(duration: Double(apiModel.clearTimeMs) / 1000.0),
            parTime: Milliseconds(duration: Double(apiModel.parTimeMs) / 1000.0),
            numberOfKeystoneUpgrades: apiModel.numKeystoneUpgrades,
            mapChallengeModeId: apiModel.mapChallengeModeId,
            zoneId: apiModel.zoneId,
            score: MythicPlusScore(apiModel.score),
            affixes: apiModel.affixes.map(Affix.init),
            url: url
        )
    }

}
