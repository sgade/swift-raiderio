//
//  RaidAchievementCurve.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//


import Foundation


public struct RaidAchievementCurve {

    public let raid: String
    public let aotc: ISO8601Date?

}

// MARK: - Decodable

extension RaidAchievementCurve: Decodable {}
