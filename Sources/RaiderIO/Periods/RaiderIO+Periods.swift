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

    private static let periodsPath = "/v1/periods"

    /// Retrieve the current, previous, and next period ids and date ranges.
    public func getPeriods() async throws -> [RegionalPeriods] {
        let periodsUrl = baseUrl.appendingPathComponent(Self.periodsPath)
        let response: PeriodsResponse = try await request(url: periodsUrl)
        return response.periods
    }

}
