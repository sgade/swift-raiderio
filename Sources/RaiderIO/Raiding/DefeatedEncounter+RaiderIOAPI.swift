//
//  DefeatedEncounter+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension DefeatedEncounter {

    init(_ apiModel: Components.Schemas.EncounterDefeated) throws {
        guard let slug = apiModel.slug else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            slug: slug,
            lastDefeated: try apiModel.lastDefeated.map(ISO8601Date.init(string:)),
            firstDefeated: try apiModel.firstDefeated.map(ISO8601Date.init(string:))
        )
    }

}
