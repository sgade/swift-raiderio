//
//  MythicPlusRatingTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 16.08.22.
//

import Foundation
import XCTest
@testable import RaiderIO

final class MythicPlusRatingTests: XCTestCase {

    var client: RaiderIO?

    override func setUp() {
        client = RaiderIO(urlSession: .shared)
    }

    func testCalculateRatingForSingleRun() {
        let run = DungeonRun.run1
        let rating = MythicPlusCalculation.rating(for: run)

        XCTAssertEqual(rating, run.score * MythicPlusCalculation.betterRunMultiplier)
    }

    func testCalculateRatingForBetterRun() {
        let run1 = DungeonRun.run1
        let run2 = DungeonRun.run2
        let rating = MythicPlusCalculation.rating(for: run1, alternateRun: run2)

        XCTAssertEqual(rating, run1.score * MythicPlusCalculation.betterRunMultiplier)
    }

    func testCalculateRatingForWorseRun() {
        let run1 = DungeonRun.run1
        let run2 = DungeonRun.run2
        let rating = MythicPlusCalculation.rating(for: run2, alternateRun: run1)

        XCTAssertEqual(rating, run2.score * MythicPlusCalculation.worseRunMultiplier)
    }

    func testCalculateTotalRatingForSingleRun() {
        let run = DungeonRun.run1
        let rating = MythicPlusCalculation.totalRating(run1: run, run2: nil)
        let ratingForOne = MythicPlusCalculation.rating(for: run)

        XCTAssertEqual(rating, run.score * MythicPlusCalculation.betterRunMultiplier)
        XCTAssertEqual(rating, ratingForOne)
    }

    func testCalculateTotalRating() {
        let run1 = DungeonRun.run1
        let run2 = DungeonRun.run2
        let rating = MythicPlusCalculation.totalRating(run1: run1, run2: run2)

        XCTAssertEqual(rating, run1.score * MythicPlusCalculation.betterRunMultiplier + run2.score * MythicPlusCalculation.worseRunMultiplier)
    }

}

extension DungeonRun {

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
