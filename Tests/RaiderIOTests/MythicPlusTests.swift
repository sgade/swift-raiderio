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

    func testFetchStaticMythicPlusData() async throws {
        do {
            let staticData = try await client!.getStaticMythicPlusData(for: .shadowlands)
            print(staticData)
        } catch {
            print(error)
            throw error
        }
    }

    func testFetchScoreTiers() async throws {
        do {
            let scoreTiers = try await client!.getMythicPlusScoreTiers(for: "season-sl-2")
            print(scoreTiers)
        } catch {
            print(error)
            throw error
        }
    }

}
