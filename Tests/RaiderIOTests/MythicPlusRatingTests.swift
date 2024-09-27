//
//  MythicPlusRatingTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 16.08.22.
//

import Foundation
import Testing
@testable import RaiderIO

@Suite
struct MythicPlusRatingTests {

    let client = RaiderIO(urlSession: .shared)

    @Test
    func calculateRatingForSingleRun() {
        let run = DungeonRun.run1
        let rating = MythicPlusCalculation.rating(for: run)

        #expect(rating == run.score * MythicPlusCalculation.betterRunMultiplier)
    }

    @Test
    func calculateRatingForBetterRun() {
        let run1 = DungeonRun.run1
        let run2 = DungeonRun.run2
        let rating = MythicPlusCalculation.rating(for: run1, alternateRun: run2)

        #expect(rating == run1.score * MythicPlusCalculation.betterRunMultiplier)
    }

    @Test
    func calculateRatingForWorseRun() {
        let run1 = DungeonRun.run1
        let run2 = DungeonRun.run2
        let rating = MythicPlusCalculation.rating(for: run2, alternateRun: run1)

        #expect(rating == run2.score * MythicPlusCalculation.worseRunMultiplier)
    }

    @Test
    func calculateTotalRatingForSingleRun() {
        let run = DungeonRun.run1
        let rating = MythicPlusCalculation.totalRating(run1: run, run2: nil)
        let ratingForOne = MythicPlusCalculation.rating(for: run)

        #expect(rating == run.score * MythicPlusCalculation.betterRunMultiplier)
        #expect(rating == ratingForOne)
    }

    @Test
    func calculateTotalRating() {
        let run1 = DungeonRun.run1
        let run2 = DungeonRun.run2
        let rating = MythicPlusCalculation.totalRating(run1: run1, run2: run2)

        #expect(
            rating ==
            run1.score * MythicPlusCalculation.betterRunMultiplier + run2.score * MythicPlusCalculation.worseRunMultiplier
        )
    }

}

// MARK: - Test data

private extension DungeonRun {

    static let run1 = DungeonRun(dungeon: "Iron Docks",
                                 shortName: "ID",
                                 mythicLevel: 16,
                                 completedAt: .now,
                                 clearTime: 0,
                                 parTime: 0,
                                 numberOfKeystoneUpgrades: 0,
                                 mapChallengeModeId: 0,
                                 zoneId: 0,
                                 score: 131.4,
                                 affixes: [
                                    Affix(id: 0, name: "Tyrannical", description: "", icon: "")
                                 ],
                                 url: URL(fileURLWithPath: "/"))

    static let run2 = DungeonRun(dungeon: "Iron Docks",
                                 shortName: "ID",
                                 mythicLevel: 15,
                                 completedAt: .now,
                                 clearTime: 0,
                                 parTime: 0,
                                 numberOfKeystoneUpgrades: 0,
                                 mapChallengeModeId: 0,
                                 zoneId: 0,
                                 score: 125.6,
                                 affixes: [
                                    Affix(id: 0, name: "Fortified", description: "", icon: "")
                                 ],
                                 url: URL(fileURLWithPath: "/"))

}
