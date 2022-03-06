//
//  RegionalPeriods.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public struct RegionalPeriods {

    public let region: RegionSlug
    public let previous: Period
    public let current: Period
    public let next: Period

    public init(region: RegionSlug, previous: Period, current: Period, next: Period) {
        self.region = region
        self.previous = previous
        self.current = current
        self.next = next
    }

}

// MARK: - Decodable

extension RegionalPeriods: Decodable {}
