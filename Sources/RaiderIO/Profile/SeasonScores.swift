//
//  SeasonScores.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation

public struct SeasonScores {

    public struct ScoreOverview {

        public let all: Float
        public let dps: Float
        public let healer: Float
        public let tank: Float
        public let spec0: Float
        public let spec1: Float
        public let spec2: Float
        public let spec3: Float

        public init(all: Float,
                    dps: Float,
                    healer: Float,
                    tank: Float,
                    spec0: Float,
                    spec1: Float,
                    spec2: Float,
                    spec3: Float) {
            self.all = all
            self.dps = dps
            self.healer = healer
            self.tank = tank
            self.spec0 = spec0
            self.spec1 = spec1
            self.spec2 = spec2
            self.spec3 = spec3
        }

    }

    public struct SegmentScore {

        public let score: Float
        public let color: String

        public init(score: Float, color: String) {
            self.score = score
            self.color = color
        }

    }

    public let season: String
    public let scores: ScoreOverview
    public let segments: [String: SegmentScore]

    public init(season: String, scores: ScoreOverview, segments: [String: SegmentScore]) {
        self.season = season
        self.scores = scores
        self.segments = segments
    }

}

// MARK: - Codable

extension SeasonScores: Codable {}

extension SeasonScores.ScoreOverview: Codable {

    private enum CodingKeys: String, CodingKey {

        case all
        case dps
        case healer
        case tank
        case spec0      = "spec_0"
        case spec1      = "spec_1"
        case spec2      = "spec_2"
        case spec3      = "spec_3"

    }

}

extension SeasonScores.SegmentScore: Codable {}
