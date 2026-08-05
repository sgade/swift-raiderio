//
//  Race+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension Race {

    init(_ apiModel: Components.Schemas.Race) throws {
        guard let id = apiModel.id,
              let name = apiModel.name,
              let slug = apiModel.slug,
              let faction = apiModel.faction
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(id: Int(id), name: name, slug: slug, faction: try Faction(string: faction))
    }

}
