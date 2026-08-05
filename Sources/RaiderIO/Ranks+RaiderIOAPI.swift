//
//  Ranks+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension Ranks {

    init(_ apiModel: Components.Schemas.Ranks) {
        self.init(world: apiModel.world, region: apiModel.region, realm: apiModel.realm)
    }

    /// Builds a dictionary keyed by role/spec-scope name from a fixed-property schema struct
    /// (`MythicPlusRoleRanks` doesn't model this as an `additionalProperties` map - it has one
    /// named, required property per scope instead).
    static func dictionary(from apiModel: Components.Schemas.MythicPlusRoleRanks) -> [String: Ranks] {
        [
            "overall": Ranks(apiModel.overall),
            "tank": Ranks(apiModel.tank),
            "healer": Ranks(apiModel.healer),
            "dps": Ranks(apiModel.dps),
            "class": Ranks(apiModel._class),
            "class_tank": Ranks(apiModel.classTank),
            "class_healer": Ranks(apiModel.classHealer),
            "class_dps": Ranks(apiModel.classDps)
        ]
    }

}
