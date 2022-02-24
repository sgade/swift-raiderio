//
//  GuildTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation
import XCTest
@testable import RaiderIO


final class GuildTests: XCTestCase {

    var client: RaiderIO?

    override func setUp() {
        client = RaiderIO(urlSession: .shared)
    }

    func testFetchGuildProfile() async throws {
        do {
            let guildProfile = try await client!.getGuildProfile(region: .eu, realm: "Frostwolf", name: "Via Draconis", fields: GuildProfileField.allCases)
            print(guildProfile)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchGuildBossKill() async throws {
        do {
            let bossKill = try await client!.getGuildBossKill(region: .eu,
                                                              realm: "Skullcrusher",
                                                              guildName: "Ludicrous Speed",
                                                              raid: "sanctum-of-domination",
                                                              boss: "the-nine",
                                                              difficulty: .heroic)

            XCTAssertNotNil(bossKill)

            print(bossKill!)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchEmptyGuildBossKill() async throws {
        do {
            let bossKill = try await client!.getGuildBossKill(region: .eu,
                                                              realm: "Frostwolf",
                                                              guildName: "Via Draconis",
                                                              raid: "sanctum-of-domination",
                                                              boss: "the-nine",
                                                              difficulty: .heroic)

            XCTAssertNil(bossKill)
        } catch {
            print(error)
            throw error
        }
    }

}
