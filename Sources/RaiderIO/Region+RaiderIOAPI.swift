//
//  Region+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension Region {

    init(_ apiModel: Components.Schemas.RegionSummary) {
        self.init(
            name: apiModel.name,
            slug: RegionSlug(rawValue: apiModel.slug),
            shortName: apiModel.shortName
        )
    }

}
