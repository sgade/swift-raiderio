//
//  ProfileTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation
import Testing
@testable import RaiderIO

@Suite
struct ProfileTests {

    let client = RaiderIO(urlSession: .shared)

    @Test
    func testFetchProfile() async {
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

        await #expect(throws: Never.self) {
            try await client.getProfile(region: .eu, realm: "Frostwolf", name: "Kiaro", fields: fields)
        }
    }

    @Test
    func fetchSpecialCharacterProfile() async {
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

        await #expect(throws: Never.self) {
            try await client.getProfile(region: .eu, realm: "Azshara", name: "Jêwlz", fields: fields)
        }
    }

}
