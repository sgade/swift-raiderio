//
//  ExtendedDungeonRunTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 18.01.23.
//

import Foundation
import Testing
@testable import RaiderIO

@Suite
struct ExtendedDungeonRunTests {

    let client = RaiderIO(urlSession: .shared)

    @Test
    func fetchGuildProfile() async {
        await #expect(throws: Never.self) {
            try await client.getExtendedRun(with: 11611033, season: "season-df-1")
        }
    }

}
