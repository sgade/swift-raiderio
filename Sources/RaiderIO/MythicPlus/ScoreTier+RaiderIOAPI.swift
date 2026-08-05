//
//  ScoreTier+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension ScoreTier {

    init(_ apiModel: Components.Schemas.ScoreTier) {
        self.init(
            score: MythicPlusScore(apiModel.score),
            rgbHex: apiModel.rgbHex,
            rgbDecimal: apiModel.rgbDecimal,
            rgbFloat: apiModel.rgbFloat.map(Float.init),
            rgbInteger: apiModel.rgbInteger
        )
    }

}
