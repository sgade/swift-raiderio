//
//  MythicPlusTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation
import XCTest
@testable import RaiderIO


final class MythicPlusTests: XCTestCase {

    var client: RaiderIO?

    override func setUp() {
        client = RaiderIO(urlSession: .shared)
    }

    func testFetchStaticMythicPlusData() async throws {
        do {
            _ = try await client!.getStaticMythicPlusData(for: .shadowlands)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchScoreTiers() async throws {
        do {
            _ = try await client!.getMythicPlusScoreTiers(for: "season-sl-2")
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchLeaderboardCapacity() async throws {
        do {
            _ = try await client!.getMythicPlusLeaderboardCapacity(for: .current, region: .eu, realm: "Frostwolf")
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchAffixes() async throws {
        do {
            _ = try await client!.getMythicPlusAffixes(region: .eu, locale: .de)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchRuns() async throws {
        do {
            _ = try await client!.getMythicPlusRuns(season: "season-sl-2",
                                                    region: .eu,
                                                    dungeon: "mists-of-tirna-scithe",
                                                    affixes: "all",
                                                    page: 0)
        } catch {
            print(error)
            throw error
        }
    }

}
