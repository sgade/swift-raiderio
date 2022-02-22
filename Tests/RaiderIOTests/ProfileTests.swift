//
//  ProfileTests.swift
//  RaiderIOTests
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation
import XCTest
@testable import RaiderIO


final class ProfileTests: XCTestCase {

    var client: RaiderIO?

    override func setUp() {
        client = RaiderIO(urlSession: .shared)
    }

    func testFetchProfile() async throws {
        do {
            let fields: [ProfileField] = [.gear, .guild, .covenant, .mythicPlusScores(by: ["current"])]
            let profile = try await client!.getProfile(region: .eu, realm: "Frostwolf", name: "Kiaro", fields: fields)
            print(profile)
        } catch {
            print(error)
            throw error
        }
    }

}
