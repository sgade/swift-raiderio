//
//  SeasonCutoffs+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension SeasonCutoffs {

    /// `cutoffs`/`ui` are siblings on `ViewSeasonCutoffsResponse` (not `ui` nested inside
    /// `cutoffs`, despite what the pre-migration raw-JSON decode assumed).
    init(cutoffs apiModel: Components.Schemas.SeasonCutoffs, ui: Components.Schemas.SeasonCutoffsUI) throws {
        guard let updatedAt = apiModel.updatedAt,
              let region = apiModel.region,
              let p990 = apiModel.p990,
              let p900 = apiModel.p900,
              let p750 = apiModel.p750,
              let p600 = apiModel.p600,
              let keystoneMaster = apiModel.keystoneMaster,
              let keystoneConqueror = apiModel.keystoneConqueror
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            updatedAt: try ISO8601Date(string: updatedAt),
            region: RegionInfo(region),
            p990: try SeasonCutoff(p990),
            p900: try SeasonCutoff(p900),
            p750: try SeasonCutoff(p750),
            p600: try SeasonCutoff(p600),
            keystoneMaster: try SeasonCutoff(keystoneMaster),
            keystoneConqueror: try SeasonCutoff(keystoneConqueror),
            ui: try UIInfo(ui)
        )
    }

}

extension SeasonCutoffs.RegionInfo {

    init(_ apiModel: Components.Schemas.RegionSummary) {
        self.init(name: apiModel.name, slug: RegionSlug(rawValue: apiModel.slug), shortName: apiModel.shortName)
    }

}

extension SeasonCutoffs.UIInfo {

    init(_ apiModel: Components.Schemas.SeasonCutoffsUI) throws {
        guard let season = apiModel.season, let region = apiModel.region else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(season: season, region: RegionSlug(rawValue: region))
    }

}

extension SeasonCutoff {

    init(_ apiModel: Components.Schemas.CutoffQuantile1) throws {
        try self.init(horde: apiModel.horde, hordeColor: apiModel.hordeColor,
                       alliance: apiModel.alliance, allianceColor: apiModel.allianceColor)
    }

    init(_ apiModel: Components.Schemas.CutoffQuantile2) throws {
        try self.init(horde: apiModel.horde, hordeColor: apiModel.hordeColor,
                       alliance: apiModel.alliance, allianceColor: apiModel.allianceColor)
    }

    init(_ apiModel: Components.Schemas.CutoffQuantile3) throws {
        try self.init(horde: apiModel.horde, hordeColor: apiModel.hordeColor,
                       alliance: apiModel.alliance, allianceColor: apiModel.allianceColor)
    }

    init(_ apiModel: Components.Schemas.CutoffQuantile4) throws {
        try self.init(horde: apiModel.horde, hordeColor: apiModel.hordeColor,
                       alliance: apiModel.alliance, allianceColor: apiModel.allianceColor)
    }

    init(_ apiModel: Components.Schemas.CutoffQuantile7) throws {
        try self.init(horde: apiModel.horde, hordeColor: apiModel.hordeColor,
                       alliance: apiModel.alliance, allianceColor: apiModel.allianceColor)
    }

    init(_ apiModel: Components.Schemas.CutoffQuantile8) throws {
        try self.init(horde: apiModel.horde, hordeColor: apiModel.hordeColor,
                       alliance: apiModel.alliance, allianceColor: apiModel.allianceColor)
    }

    /// Shared by every `init(_:)` overload above - each `CutoffQuantile*` schema variant has the
    /// identical `horde`/`hordeColor`/`alliance`/`allianceColor` shape (a generator dedup
    /// artifact - see `update-openapi-definition.sh`), just as distinct nominal Swift types.
    private init(horde: Components.Schemas.CutoffFactionQuantile?,
                 hordeColor: Swift.String?,
                 alliance: Components.Schemas.CutoffFactionQuantile1?,
                 allianceColor: Swift.String?) throws {
        guard let horde, let hordeColor, let alliance, let allianceColor else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            horde: try FactionCutoff(horde),
            hordeColor: hordeColor,
            alliance: try FactionCutoff(alliance),
            allianceColor: allianceColor
        )
    }

}

extension SeasonCutoff.FactionCutoff {

    init(_ apiModel: Components.Schemas.CutoffFactionQuantile) throws {
        guard let quantile = apiModel.quantile,
              let quantileMinValue = apiModel.quantileMinValue,
              let quantilePopulationCount = apiModel.quantilePopulationCount,
              let quantilePopulationFraction = apiModel.quantilePopulationFraction,
              let totalPopulationCount = apiModel.totalPopulationCount
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            quantile: Float(quantile),
            quantileMinValue: Float(quantileMinValue),
            quantilePopulationCount: quantilePopulationCount,
            quantilePopulationFraction: quantilePopulationFraction,
            totalPopulationCount: totalPopulationCount
        )
    }

    init(_ apiModel: Components.Schemas.CutoffFactionQuantile1) throws {
        guard let quantile = apiModel.quantile,
              let quantileMinValue = apiModel.quantileMinValue,
              let quantilePopulationCount = apiModel.quantilePopulationCount,
              let quantilePopulationFraction = apiModel.quantilePopulationFraction,
              let totalPopulationCount = apiModel.totalPopulationCount
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            quantile: Float(quantile),
            quantileMinValue: Float(quantileMinValue),
            quantilePopulationCount: quantilePopulationCount,
            quantilePopulationFraction: quantilePopulationFraction,
            totalPopulationCount: totalPopulationCount
        )
    }

}
