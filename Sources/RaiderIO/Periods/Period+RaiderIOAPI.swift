//
//  Period+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension Period {

    init(_ apiModel: Components.Schemas.Period) throws {
        self.init(
            period: apiModel.period,
            start: try ISO8601Date(string: apiModel.start),
            end: try ISO8601Date(string: apiModel.end)
        )
    }

}
