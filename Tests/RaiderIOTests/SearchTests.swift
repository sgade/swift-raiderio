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
                if case .character(let character) = $0.data {
                    return character.region.slug == .eu && character.realm.name == "Frostwolf" && character.name == "Kiaro"
                }
                return false
            })

            XCTAssertNotNil(expectedResult)
        } catch {
            print(error)
            throw error
        }
    }

}
