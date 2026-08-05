//
//  RegionalPeriods+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension RegionalPeriods {

    init(_ apiModel: Components.Schemas.RegionPeriod) throws {
        self.init(
            region: RegionSlug(rawValue: apiModel.region),
            previous: try Period(apiModel.previous),
            current: try Period(apiModel.current),
            next: try Period(apiModel.next)
        )
    }

}
