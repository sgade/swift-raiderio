//
//  Dungeon+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension Dungeon {

    init(_ apiModel: Components.Schemas.LeaderboardDungeon) throws {
        guard let id = apiModel.id,
            let name = apiModel.name,
            let shortName = apiModel.shortName,
            let slug = apiModel.slug,
            let expansionId = apiModel.expansionId,
            let patch = apiModel.patch,
            let keystoneTimerMs = apiModel.keystoneTimerMs
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            id: id,
            name: name,
            shortName: shortName,
            slug: slug,
            expansion: Expansion(rawValue: expansionId),
            patch: patch,
            keystoneTimer: Milliseconds(duration: Double(keystoneTimerMs) / 1000.0),
            numberOfBosses: apiModel.numBosses
        )
    }

}
