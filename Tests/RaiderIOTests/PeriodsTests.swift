//
//  PeriodsTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation
import Testing
@testable import RaiderIO

@Suite
struct PeriodsTests {

    let client = RaiderIO(urlSession: .shared)

    @Test
    func fetchPeriods() async {
        await #expect(throws: Never.self) {
            try await client.getPeriods()
        }
    }

}
