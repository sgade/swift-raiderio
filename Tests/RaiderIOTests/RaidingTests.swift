//
//  RaidingTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation
import Testing
@testable import RaiderIO

@Suite
struct RaidingTests {

    let client = RaiderIO(urlSession: .shared)

    @Test
    func fetchStaticRaidingData() async {
        await #expect(throws: Never.self) {
            try await client.getStaticRaidingData(for: .shadowlands)
        }
    }

    @Test
    func fetchBossRankings() async {
        await #expect(throws: Never.self) {
            try await client.getRaidingBossRankings(raid: .sanctumOfDomination,
                                                    boss: "the-nine",
                                                    difficulty: .normal,
                                                    region: .german)
        }
    }

    @Test
    func fetchHallOfFame() async {
        await #expect(throws: Never.self) {
            try await client.getRaidingHallOfFame(raid: .sanctumOfDomination,
                                                  difficulty: .normal,
                                                  region: .eu)
        }
    }

    @Test
    func fetchRaidingProgression() async {
        await #expect(throws: Never.self) {
            try await client.getRaidingProgression(raid: .sanctumOfDomination,
                                                   difficulty: .normal,
                                                   region: .us)
        }
    }

    @Test
    func fetchRaidRankings() async {
        await #expect(throws: Never.self) {
            try await client.getRaidRankings(raid: .sanctumOfDomination,
                                             difficulty: .normal,
                                             region: .german)
        }
    }

}
