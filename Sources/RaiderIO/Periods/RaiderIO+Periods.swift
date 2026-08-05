//
//  RaiderIO+Periods.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation

extension RaiderIO {

    /// Retrieve the current, previous, and next period ids and date ranges.
    public func getPeriods() async throws -> [RegionalPeriods] {
        switch try await client.getApiV1Periods() {
        case .ok(let ok):
            return try ok.body.json.periods.map(RegionalPeriods.init)
        case .undocumented(let statusCode, _):
            throw RaiderIOError.http(statusCode: statusCode)
        }
    }

}
