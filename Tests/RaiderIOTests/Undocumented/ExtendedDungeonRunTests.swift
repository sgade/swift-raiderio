//
//  ExtendedDungeonRunTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 18.01.23.
//

import Foundation
import XCTest
@testable import RaiderIO

final class ExtendedDungeonRunTests: XCTestCase {

    var client: RaiderIO?

    override func setUp() {
        client = RaiderIO(urlSession: .shared)
    }

    func testFetchGuildProfile() async throws {
        do {
            _ = try await client?.getExtendedRun(with: 11611033, season: "season-df-1")
        } catch {
            print(error)
            throw error
        }
    }

}
