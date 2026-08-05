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

    let client = RaiderIO(urlSession: URLSession(configuration: .ephemeral))

    @Test
    func fetchStaticRaidingData() async {
        await #expect(throws: Never.self) {
            try await client.getStaticRaidingData(for: .shadowlands)
        }
    }

    @Test
    func fetchInvalidStaticRaidingData() async {
        // RaiderIOAPI's generated client only exposes documented (200) responses as typed
        // values; other statuses land in `.undocumented`, from which only the status code is
        // cheaply available (see RaiderIO.swift) - so this no longer surfaces the response
        // body's `{error, message}` text as `.server(...)`, just the bare status.
        let expectedError = RaiderIOError.http(statusCode: 400)

        await #expect(throws: expectedError) {
            try await client.getStaticRaidingData(for: .init(rawValue: 5))
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
