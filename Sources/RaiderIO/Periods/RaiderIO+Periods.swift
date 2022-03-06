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

    private static let periodsUrl = URL(string: "https://raider.io/api/v1/periods")!

    /// Retrieve the current, previous, and next period ids and date ranges.
    public func getPeriods() async throws -> [RegionalPeriods] {
        let response: PeriodsResponse = try await request(url: RaiderIO.periodsUrl)
        return response.periods
    }

}
