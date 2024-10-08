//
//  SearchTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 10.03.22.
//

import Foundation
import Testing
@testable import RaiderIO

@Suite
struct SearchTests {

    let client = RaiderIO(urlSession: .shared)

    @Test
    func searchForKnownCharacter() async throws {
        let results = try await client.search(for: "Kiaro")

        let expectedResult = results.first(where: {
            guard case .character(let character) = $0.data else {
                return false
            }
            return character.region.slug == .eu && character.realm.name == "Frostwolf" && character.name == "Kiaro"
        })

        #expect(expectedResult != nil)
    }

    @Test
    func searchForKnownGuild() async throws {
        let results = try await client.search(for: "Via Draconis")

        let expectedResult = results.first(where: {
            guard case .guild(let guild) = $0.data else {
                return false
            }
            return guild.region.slug == .eu && guild.realm.name == "Frostwolf" && guild.name == "Via Draconis"
        })

        #expect(expectedResult != nil)
    }

    @Test
    func searchForKnownTeam() async throws {
        let results = try await client.search(for: "Via Draconis")

        let expectedResult = results.first(where: {
            guard case .team(let team) = $0.data else {
                return false
            }
            return team.region.slug == .eu && team.name == "Via Draconis"
        })

        #expect(expectedResult != nil)
    }

}
