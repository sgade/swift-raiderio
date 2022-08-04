//
//  PeriodsTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation
import XCTest
@testable import RaiderIO

final class PeriodsTests: XCTestCase {

    var client: RaiderIO?

    override func setUp() {
        client = RaiderIO(urlSession: .shared)
    }

    func testFetchPeriods() async throws {
        do {
            _ = try await client!.getPeriods()
        } catch {
            print(error)
            throw error
        }
    }

}
