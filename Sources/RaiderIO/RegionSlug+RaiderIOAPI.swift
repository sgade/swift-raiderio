//
//  RegionSlug+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension RegionSlug {

    convenience init(_ apiModel: Components.Schemas.Region) {
        self.init(rawValue: apiModel.rawValue)
    }

}
