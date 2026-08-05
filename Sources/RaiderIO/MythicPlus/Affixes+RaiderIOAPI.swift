//
//  Affixes+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import Foundation
import RaiderIOAPI

extension Affixes {

    init(_ apiModel: Components.Schemas.ViewRegionAffixesResponse) throws {
        guard let leaderboardUrl = URL(string: apiModel.leaderboardUrl) else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            region: RegionSlug(apiModel.region),
            title: apiModel.title,
            leaderboardUrl: leaderboardUrl,
            affixDetails: apiModel.affixDetails.map(Affix.init)
        )
    }

}
