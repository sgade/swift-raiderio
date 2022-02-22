//
//  SeasonCutoffs.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//


import Foundation


public struct SeasonCutoffs {

    public struct RegionInfo {

        public let name: String
        public let slug: String
        public let shortName: String

    }

    public struct UIInfo {

        public let season: String
        public let region: RegionSlug

    }

    public let updatedAt: ISO8601Date
    public let region: RegionInfo
    public let p990: SeasonCutoff
    public let p900: SeasonCutoff
    public let p750: SeasonCutoff
    public let p600: SeasonCutoff
    public let keystoneMaster: SeasonCutoff
    public let keystoneConqueror: SeasonCutoff
    public let ui: UIInfo

}


public struct SeasonCutoff {

    public struct FactionCutoff {

        public let quantile: Float
        public let quantileMinValue: Float
        public let quantilePopulationCount: Int
        public let quantilePopulationFraction: Double
        public let totalPopulationCount: Int

    }

    public let horde: FactionCutoff
    public let hordeColor: String
    public let alliance: FactionCutoff
    public let allianceColor: String

}

// MARK: - Decodable

extension SeasonCutoffs: Decodable {}

extension SeasonCutoffs.RegionInfo: Decodable {

    private enum CodingKeys: String, CodingKey {

        case name
        case slug
        case shortName  = "short_name"

    }

}

extension SeasonCutoffs.UIInfo: Decodable {}


extension SeasonCutoff: Decodable {}

extension SeasonCutoff.FactionCutoff: Decodable {}
