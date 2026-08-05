//
//  StaticMythicPlusData+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension StaticMythicPlusData {

    init(_ apiModel: Components.Schemas.ViewMythicPlusStaticDataResponse) {
        self.init(
            seasons: apiModel.seasons.map(Season.init),
            dungeons: apiModel.dungeons.map(Dungeon.init)
        )
    }

}

extension StaticMythicPlusData.Season {

    init(_ apiModel: Components.Schemas.SeasonStaticData) {
        self.init(slug: apiModel.slug, name: apiModel.name)
    }

}

extension StaticMythicPlusData.Dungeon {

    init(_ apiModel: Components.Schemas.DungeonStaticData) {
        self.init(
            id: apiModel.id,
            challengeModeId: apiModel.challengeModeId,
            slug: apiModel.slug,
            name: apiModel.name,
            shortName: apiModel.shortName
        )
    }

}
