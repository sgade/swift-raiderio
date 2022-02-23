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
            let staticData = try await client!.getStaticMythicPlusData(for: .shadowlands)
            print(staticData)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchScoreTiers() async throws {
        do {
            let scoreTiers = try await client!.getMythicPlusScoreTiers(for: "season-sl-2")
            print(scoreTiers)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchLeaderboardCapacity() async throws {
        do {
            let leaderboardCapacity = try await client!.getMythicPlusLeaderboardCapacity(for: .current, region: .eu, realm: "Frostwolf")
            print(leaderboardCapacity)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchAffixes() async throws {
        do {
            let affixes = try await client!.getMythicPlusAffixes(region: .eu, locale: .de)
            print(affixes)
        } catch {
            print(error)
            throw error
        }
    }

}
