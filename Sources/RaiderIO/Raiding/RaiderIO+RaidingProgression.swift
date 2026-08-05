//
//  RaiderIO+RaidingProgression.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//

import Foundation

extension RaiderIO {

    /// Retrieve details of raiding progression for a raid.
    ///
    /// - Parameters:
    ///     - raid: Raid to look up. This is the raid's name in slug form: `"tomb-of-sargeras"`.
    ///     - difficulty: Difficulty to restrict progress to.
    ///     - region: Name of region to restrict progress to.
    public func getRaidingProgression(
        raid: RaidSlug,
        difficulty: Difficulty,
        region: RegionSlug
    ) async throws -> [RaidProgressionEntry] {
        switch try await client.getApiV1RaidingProgression(query: .init(
            raid: try convert(from: raid),
            difficulty: try convert(from: difficulty),
            region: try convert(from: region)
        )) {
        case .ok(let ok):
            return try (ok.body.json.progression ?? []).map(RaidProgressionEntry.init)
        case .undocumented(let statusCode, _):
            throw RaiderIOError.http(statusCode: statusCode)
        }
    }

}
