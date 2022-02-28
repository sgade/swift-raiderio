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
            _ = try await client!.getStaticRaidingData(for: .shadowlands)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchBossRankings() async throws {
        do {
            _ = try await client!.getRaidingBossRankings(raid: .sanctumOfDomination,
                                                         boss: "the-nine",
                                                         difficulty: .normal,
                                                         region: .german)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchHallOfFame() async throws {
        do {
            _ = try await client!.getRaidingHallOfFame(raid: .sanctumOfDomination,
                                                       difficulty: .normal,
                                                       region: .eu)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchRaidingProgression() async throws {
        do {
            _ = try await client!.getRaidingProgression(raid: .sanctumOfDomination,
                                                        difficulty: .normal,
                                                        region: .us)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchRaidRankings() async throws {
        do {
            _ = try await client!.getRaidRankings(raid: .sanctumOfDomination,
                                                  difficulty: .normal,
                                                  region: .german)
        } catch {
            print(error)
            throw error
        }
    }

}
