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
        public let slug: RegionSlug
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
    // swiftlint:disable inclusive_language
    public let keystoneMaster: SeasonCutoff
    // swiftlint:enable inclusive_language
    public let keystoneConqueror: SeasonCutoff
    // swiftlint:disable identifier_name
    public let ui: UIInfo
    // swiftlint:enable identifier_name

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

// MARK: - Codable

extension SeasonCutoffs: Codable {}

extension SeasonCutoffs.RegionInfo: Codable {

    private enum CodingKeys: String, CodingKey {

        case name
        case slug
        case shortName  = "short_name"

    }

}

extension SeasonCutoffs.UIInfo: Codable {}


extension SeasonCutoff: Codable {}

extension SeasonCutoff.FactionCutoff: Codable {}
