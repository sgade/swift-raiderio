//
//  BossKill+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension BossKill {

    init(kill apiKill: Components.Schemas.BossKill, roster apiRoster: Components.Schemas.Roster) throws {
        let roster = try apiRoster.compactMap { member -> Character? in
            guard let character = member.character else { return nil }
            return try Character(character)
        }

        self.init(kill: try Kill(apiKill), roster: roster)
    }

}

extension BossKill.Kill {

    init(_ apiModel: Components.Schemas.BossKill) throws {
        self.init(
            pulledAt: try apiModel.pulledAt.map(ISO8601Date.init(string:)),
            defeatedAt: try apiModel.defeatedAt.map(ISO8601Date.init(string:)),
            duration: apiModel.durationMs.map { Milliseconds(duration: Double($0) / 1000.0) },
            isSuccess: apiModel.isSuccess ?? false,
            itemLevelEquippedAverage: apiModel.itemLevelEquippedAvg.map(Float.init),
            itemLevelEquippedMax: apiModel.itemLevelEquippedMax.map(Float.init),
            itemLevelEquippedMin: apiModel.itemLevelEquippedMin.map(Float.init)
        )
    }

}
