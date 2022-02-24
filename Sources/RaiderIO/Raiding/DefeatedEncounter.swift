//
//  DefeatedEncounter.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//


import Foundation


public struct DefeatedEncounter {

    public let slug: String
    public let lastDefeated: ISO8601Date
    public let firstDefeated: ISO8601Date

}

// MARK: - Decodable

extension DefeatedEncounter: Decodable {}
