//
//  RaiderIO+RaidingHallOfFame.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//

import Foundation

extension RaiderIO {

    private struct HallOfFameResponse: Decodable {

        public let hallOfFame: HallOfFame

    }

    /// Retrieve the hall of fame for a given raid.
    ///
    /// - Parameters:
    ///     - raid: Raid to look up. This is the raid's name in slug form: `"tomb-of-sargeras"`.
    ///     - difficulty: Difficulty to restrict progress to.
    ///     - region: Name of region to restrict progress to.
    public func getRaidingHallOfFame(
        raid: RaidSlug,
        difficulty: Difficulty,
        region: RegionSlug
    ) async throws -> HallOfFame {
        let response: HallOfFameResponse = try await parse {
            try await client.getApiV1RaidingHalloffame(query: .init(
                raid: try convert(from: raid),
                difficulty: try convert(from: difficulty),
                region: try convert(from: region)
            )).default.body.any
        }
        return response.hallOfFame
    }

}
