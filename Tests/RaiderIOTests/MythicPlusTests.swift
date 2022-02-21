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

    func testFetchProfile() async throws {
        do {
            let staticData = try await client!.getStaticMythicPlusData(for: .shadowlands)
            print(staticData)
        } catch {
            print(error)
            throw error
        }
    }

}
