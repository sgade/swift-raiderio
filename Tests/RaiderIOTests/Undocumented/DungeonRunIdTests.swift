//
//  DungeonRunIdTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 17.01.23.
//

import Foundation
import Testing
@testable import RaiderIO

@Suite
struct DungeonRunIdTests {

    @Test
    func idParsing() {
        let url = URL(string: "https://raider.io/mythic-plus-runs/season-df-1/11611033-16-ruby-life-pools")!

        let run = DungeonRun(
            dungeon: "Ruby Life Pools",
            shortName: "RLP",
            mythicLevel: 16,
            completedAt: .now,
            clearTime: Milliseconds(duration: 0),
            parTime: Milliseconds(duration: 0),
            numberOfKeystoneUpgrades: 1,
            mapChallengeModeId: 123,
            zoneId: 134,
            score: 100,
            affixes: [],
            url: url
        )

        #expect(run.id == 11611033)
    }

}
