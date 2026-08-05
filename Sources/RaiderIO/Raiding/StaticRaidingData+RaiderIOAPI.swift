//
//  StaticRaidingData+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension StaticRaidingData {

    init(_ apiModel: Components.Schemas.ViewRaidingStaticDataResponse) {
        self.init(raids: apiModel.raids.map(Raid.init))
    }

}
