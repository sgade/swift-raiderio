//
//  RegionalPeriods.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public struct RegionalPeriods {

    public let region: Region
    public let previous: Period
    public let current: Period
    public let next: Period

}

// MARK: - Decodable

extension RegionalPeriods: Decodable {}
