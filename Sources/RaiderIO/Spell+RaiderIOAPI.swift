//
//  Spell+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension Spell {

    init(_ apiModel: Components.Schemas.Spell) throws {
        guard let id = apiModel.id,
              let name = apiModel.name,
              let icon = apiModel.icon,
              let school = apiModel.school
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(id: id, name: name, icon: icon, school: school, rank: apiModel.rank.flatMap(Int.init))
    }

}
