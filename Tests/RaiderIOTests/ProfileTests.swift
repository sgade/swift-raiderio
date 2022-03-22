//
//  ProfileTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation
import XCTest
@testable import RaiderIO


final class ProfileTests: XCTestCase {

    var client: RaiderIO?

    override func setUp() {
        client = RaiderIO(urlSession: .shared)
    }

    func testFetchProfile() async throws {
        do {
            let fields: [ProfileField] = [
                .gear,
                .guild,
                .covenant,
                .raidProgression,
                .mythicPlusScores(by: ["current", "previous"]),
                .mythicPlusRanks,
                .mythicPlusRecentRuns,
                .mythicPlusBestRuns,
                .mythicPlusAlternateRuns,
                .mythicPlusHighestLevelRuns,
                .mythicPlusWeeklyHighestLevelRuns,
                .previousMythicPlusRanks,
                .raidAchievementMeta(tiers: ["tier28", "tier27"]),
                .raidAchievementCurve(raids: [.castleNathria, .sanctumOfDomination])
            ]

            _ = try await client!.getProfile(region: .eu, realm: "Frostwolf", name: "Kiaro", fields: fields)
        } catch {
            print(error)
            throw error
        }
    }

}
