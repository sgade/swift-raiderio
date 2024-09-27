//
//  GuildTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation
import Testing
@testable import RaiderIO

@Suite
struct GuildTests {

    let client = RaiderIO(urlSession: .shared)

    @Test
    func fetchGuildProfile() async {
        await #expect(throws: Never.self) {
            try await client.getGuildProfile(region: .eu,
                                             realm: "Frostwolf",
                                             name: "Via Draconis",
                                             fields: GuildProfileField.allCases)
        }
    }

    @Test
    func fetchGuildBossKillFromLegion() async {
        await #expect(throws: Never.self) {
            let bossKill = try await client.getGuildBossKill(region: .kr,
                                                             realm: "Azshara",
                                                             guildName: "AFK R",
                                                             raid: .tombOfSageras,
                                                             boss: "kiljaeden",
                                                             difficulty: .mythic)

            #expect(bossKill != nil)
        }
    }

    @Test
    func fetchGuildBossKillFromBattleForAzeroth() async {
        await #expect(throws: Never.self) {
            let bossKill = try await client.getGuildBossKill(region: .eu,
                                                             realm: "Tarren Mill",
                                                             guildName: "Method",
                                                             raid: .NyalothaTheWakingCity,
                                                             boss: "nzoth-the-corruptor",
                                                             difficulty: .mythic)

            #expect(bossKill != nil)
        }
    }

    @Test
    func fetchGuildBossKillFromShadowlands() async {
        await #expect(throws: Never.self) {
            let bossKill = try await client.getGuildBossKill(region: .us,
                                                             realm: "Skullcrusher",
                                                             guildName: "Ludicrous Speed",
                                                             raid: .sanctumOfDomination,
                                                             boss: "the-nine",
                                                             difficulty: .heroic)

            #expect(bossKill != nil)
        }
    }

    @Test
    func fetchGuildBossKillFromDragonflight() async {
        await #expect(throws: Never.self) {
            let bossKill = try await client.getGuildBossKill(region: .eu,
                                                             realm: "Tarren Mill",
                                                             guildName: "Echo",
                                                             raid: .vaultOfTheIncarnates,
                                                             boss: "raszageth-the-stormeater",
                                                             difficulty: .mythic)

            #expect(bossKill != nil)
        }
    }

    @Test
    func fetchEmptyGuildBossKill() async {
        await #expect(throws: Never.self) {
            let bossKill = try await client.getGuildBossKill(region: .eu,
                                                             realm: "Frostwolf",
                                                             guildName: "Via Draconis",
                                                             raid: .sanctumOfDomination,
                                                             boss: "the-nine",
                                                             difficulty: .heroic)
            
            #expect(bossKill == nil)
        }
    }

}
