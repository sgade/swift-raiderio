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

}