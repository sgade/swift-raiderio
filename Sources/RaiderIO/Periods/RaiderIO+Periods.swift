//
//  RaiderIO+Periods.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation

private struct PeriodsResponse: Decodable {

    public let periods: [RegionalPeriods]

}

extension RaiderIO {

    /// Retrieve the current, previous, and next period ids and date ranges.
    public func getPeriods() async throws -> [RegionalPeriods] {
        let response: PeriodsResponse = try await parse {
            try await client.getApiV1Periods()
                .default.body.any
        }
        return response.periods
    }

}
