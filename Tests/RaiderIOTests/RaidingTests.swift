//
//  RaidingTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation
import XCTest
@testable import RaiderIO


final class RaidingTests: XCTestCase {

    var client: RaiderIO?

    override func setUp() {
        client = RaiderIO(urlSession: .shared)
    }

    func testFetchStaticRaidingData() async throws {
        do {
            let staticData = try await client!.getStaticRaidingData(for: .shadowlands)
            print(staticData)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchBossRankings() async throws {
        do {
            let bossRankings = try await client!.getRaidingBossRankings(raid: "sanctum-of-domination",
                                                                        boss: "the-nine",
                                                                        difficulty: .normal,
                                                                        region: RegionSlug.us.rawValue,
                                                                        realm: "Skullcrusher")
            print(bossRankings)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchHallOfFame() async throws {
        do {
            let hallOfFame = try await client!.getRaidingHallOfFame(raid: "sanctum-of-domination",
                                                                    difficulty: .normal,
                                                                    region: .eu)
            print(hallOfFame)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchRaidingProgression() async throws {
        do {
            let progression = try await client!.getRaidingProgression(raid: "sanctum-of-domination",
                                                                      difficulty: .normal,
                                                                      region: .eu)
            print(progression)
        } catch {
            print(error)
            throw error
        }
    }

}
