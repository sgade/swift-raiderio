//
//  SearchTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 10.03.22.
//


import Foundation
import XCTest
@testable import RaiderIO


final class SearchTests: XCTestCase {

    var client: RaiderIO!

    override func setUp() {
        client = RaiderIO(urlSession: .shared)
    }

    func testSearchForCharacter() async throws {
        do {
            let results = try await client.search(for: "Kiaro")

            let expectedResult = results.first(where: {
                guard case .character(let character) = $0.data else {
                    return false
                }
                return character.region.slug == .eu && character.realm.name == "Frostwolf" && character.name == "Kiaro"
            })

            XCTAssertNotNil(expectedResult)
        } catch {
            print(error)
            throw error
        }
    }

    func testSearchForGuild() async throws {
        do {
            let results = try await client.search(for: "Via Draconis")

            let expectedResult = results.first(where: {
                guard case .guild(let guild) = $0.data else {
                    return false
                }
                return guild.region.slug == .eu && guild.realm.name == "Frostwolf" && guild.name == "Via Draconis"
            })

            XCTAssertNotNil(expectedResult)
        } catch {
            print(error)
            throw error
        }
    }

    func testSearchForTeam() async throws {
        do {
            let results = try await client.search(for: "Via Draconis")

            let expectedResult = results.first(where: {
                guard case .team(let team) = $0.data else {
                    return false
                }
                return team.region.slug == .eu && team.name == "Via Draconis"
            })

            XCTAssertNotNil(expectedResult)
        } catch {
            print(error)
            throw error
        }
    }

}
