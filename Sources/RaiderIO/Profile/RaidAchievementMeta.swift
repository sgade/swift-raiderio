//
//  RaidAchievementMeta.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation


public struct RaidAchievementMeta {

    public struct Achievement {

        public let id: Int
        public let raid: String
        public let timestamp: ISO8601Date?

        public init(id: Int, raid: String, timestamp: ISO8601Date? = nil) {
            self.id = id
            self.raid = raid
            self.timestamp = timestamp
        }

    }

    public let tier: String
    public let completedCount: Int
    public let totalCount: Int
    public let metaAchievement: Achievement
    public let completedAchievements: [Achievement]
    public let remainingAchievements: [Achievement]

    public init(tier: String,
                completedCount: Int,
                totalCount: Int,
                metaAchievement: Achievement,
                completedAchievements: [Achievement],
                remainingAchievements: [Achievement]) {
        self.tier = tier
        self.completedCount = completedCount
        self.totalCount = totalCount
        self.metaAchievement = metaAchievement
        self.completedAchievements = completedAchievements
        self.remainingAchievements = remainingAchievements
    }

}

// MARK: - Codable

extension RaidAchievementMeta: Codable {

    private enum CodingKeys: String, CodingKey {

        case tier
        case completedCount         = "completed_count"
        case totalCount             = "total_count"
        case metaAchievement        = "meta_achievement"
        case completedAchievements  = "completed_achievements"
        case remainingAchievements  = "remaining_achievements"

    }

}


extension RaidAchievementMeta.Achievement: Codable {}
