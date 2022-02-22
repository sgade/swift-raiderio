//
//  SeasonScores.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//


import Foundation


public struct SeasonScores {

    public struct ScoreOverview {

        public let all: Int
        public let dps: Int
        public let healer: Int
        public let tank: Int
        public let spec0: Int
        public let spec1: Int
        public let spec2: Int
        public let spec3: Int

    }

    public struct SegmentScore {

        public let score: Int
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
