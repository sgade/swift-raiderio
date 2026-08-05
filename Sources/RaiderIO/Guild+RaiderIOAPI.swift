//
//  Guild+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension Guild {

    init(_ apiModel: Components.Schemas.RaidingGuild) throws {
        guard let id = apiModel.id,
              let name = apiModel.name,
              let faction = apiModel.faction,
              let realm = apiModel.realm,
              let region = apiModel.region,
              let path = apiModel.path
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            id: id,
            name: name,
            faction: try Faction(string: faction),
            realm: try Realm(realm),
            region: Region(region),
            path: path
        )
    }

    init(_ apiModel: Components.Schemas.GuildSummary) throws {
        guard let realm = apiModel.realm, let region = apiModel.region else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            id: apiModel.id,
            name: apiModel.name,
            faction: Faction(apiModel.faction),
            realm: Realm(realm),
            region: Region(region),
            path: apiModel.path
        )
    }

}
