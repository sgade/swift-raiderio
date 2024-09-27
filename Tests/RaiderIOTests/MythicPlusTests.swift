//
//  MythicPlusTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation
import Testing
@testable import RaiderIO

@Suite
struct MythicPlusTests {

    let client = RaiderIO(urlSession: .shared)

    @Test
    func fetchStaticMythicPlusData() async {
        await #expect(throws: Never.self) {
            try await client.getStaticMythicPlusData(for: .shadowlands)
        }
    }

    @Test
    func fetchScoreTiers() async {
        await #expect(throws: Never.self) {
            try await client.getMythicPlusScoreTiers(for: "season-sl-2")
        }
    }

    @Test
    func fetchLeaderboardCapacity() async {
        await #expect(throws: Never.self) {
            try await client.getMythicPlusLeaderboardCapacity(for: .current, region: .eu, realm: "Frostwolf")
        }
    }

    @Test
    func fetchAffixes() async {
        await #expect(throws: Never.self) {
            try await client.getMythicPlusAffixes(region: .eu, locale: .de)
        }
    }

    @Test
    func fetchRuns() async {
        await #expect(throws: Never.self) {
            try await client.getMythicPlusRuns(season: "season-sl-2",
                                               region: .eu,
                                               dungeon: "mists-of-tirna-scithe",
                                               affixes: "all",
                                               page: 0)
        }
    }

}
