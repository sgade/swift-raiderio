//
//  RaiderIO+ExtendedDungeonRun.swift
//  RaiderIO
//
//  Created by Sören Gade on 17.01.23.
//

import Foundation

extension RaiderIO {

    private static let mythicPlusRunPath = "/mythic-plus/runs/"

    public func getExtendedRun(with id: Int, season seasonSlug: String) async throws -> ExtendedDungeonRun {
        let url = baseUrl
            .appendingPathComponent(Self.mythicPlusRunPath)
            .appendingPathComponent(seasonSlug)
            .appendingPathComponent("\(id)")

        let container: Container = try await request(url: url)
        return container.keystoneRun
    }

}

private struct Container: Codable {

    let keystoneRun: ExtendedDungeonRun

}
