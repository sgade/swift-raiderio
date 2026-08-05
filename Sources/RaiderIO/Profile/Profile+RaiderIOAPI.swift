//
//  Profile+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import Foundation
import RaiderIOAPI

extension Profile {

    init(_ apiModel: Components.Schemas.ViewCharacterProfileResponse) throws {
        guard let thumbnailUrl = URL(string: apiModel.thumbnailUrl) else {
            throw RaiderIOError.typeConversionFailure
        }

        let gear = apiModel.gear.map(Profile.Gear.init)
        let raidProgression = apiModel.raidProgression.map(RaidProgression.dictionary(from:))
        let mythicPlusScoresBySeason = apiModel.mythicPlusScoresBySeason?.map(SeasonScores.init)
        let mythicPlusRanks = apiModel.mythicPlusRanks.map(Ranks.dictionary(from:))
        let mythicPlusRecentRuns = try apiModel.mythicPlusRecentRuns?.map(DungeonRun.init)
        let mythicPlusBestRuns = try apiModel.mythicPlusBestRuns?.map(DungeonRun.init)
        let mythicPlusAlternateRuns = try apiModel.mythicPlusAlternateRuns?.map(DungeonRun.init)
        let previousMythicPlusRanks = apiModel.previousMythicPlusRanks.map(Ranks.dictionary(from:))

        self.init(
            name: apiModel.name,
            race: apiModel.race,
            class: apiModel._class,
            activeSpecName: apiModel.activeSpecName,
            activeSpecRole: try Role(string: apiModel.activeSpecRole),
            gender: try Gender(apiModel.gender),
            faction: Faction(apiModel.faction),
            region: RegionSlug(apiModel.region),
            realm: apiModel.realm,
            profileUrl: try SpecialCharactersURL(string: apiModel.profileUrl).url,
            profileBanner: apiModel.profileBanner,
            achievementPoints: apiModel.achievementPoints,
            thumbnailUrl: thumbnailUrl,
            lastCrawledAt: try ISO8601Date(string: apiModel.lastCrawledAt),
            gear: gear,
            raidProgression: raidProgression,
            mythicPlusScoresBySeason: mythicPlusScoresBySeason,
            mythicPlusRanks: mythicPlusRanks,
            mythicPlusRecentRuns: mythicPlusRecentRuns,
            mythicPlusBestRuns: mythicPlusBestRuns,
            mythicPlusAlternateRuns: mythicPlusAlternateRuns,
            previousMythicPlusRanks: previousMythicPlusRanks
        )
    }

}

extension Profile.Gear {

    init(_ apiModel: Components.Schemas.CharacterGear) {
        self.init(
            itemLevelEquipped: Float(apiModel.itemLevelEquipped),
            itemLevelTotal: Float(apiModel.itemLevelTotal),
            artifactTraits: Float(apiModel.artifactTraits)
        )
    }

}
