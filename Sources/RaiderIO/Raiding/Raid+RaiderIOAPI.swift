//
//  Raid+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension Raid {

    init(_ apiModel: Components.Schemas.RaidStaticData) {
        self.init(
            id: apiModel.id,
            slug: RaidSlug(rawValue: apiModel.slug),
            name: apiModel.name,
            shortName: apiModel.shortName,
            encounters: apiModel.encounters.map(Encounter.init)
        )
    }

}

extension Raid.Encounter {

    init(_ apiModel: Components.Schemas.RaidEncounter) {
        self.init(id: apiModel.id, slug: apiModel.slug, name: apiModel.name)
    }

}
