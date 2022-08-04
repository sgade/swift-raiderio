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

    public init(raid: String, aotc: ISO8601Date? = nil) {
        self.raid = raid
        self.aotc = aotc
    }

}

// MARK: - Codable

extension RaidAchievementCurve: Codable {}
