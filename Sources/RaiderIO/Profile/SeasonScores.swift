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

    }

    public struct SegmentScore {

        public let score: Float
        public let color: String

    }

    public let season: String
    public let scores: ScoreOverview
    public let segments: [String: SegmentScore]

}

// MARK: - Decodable

extension SeasonScores: Decodable {}


extension SeasonScores.ScoreOverview: Decodable {

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


extension SeasonScores.SegmentScore: Decodable {}
