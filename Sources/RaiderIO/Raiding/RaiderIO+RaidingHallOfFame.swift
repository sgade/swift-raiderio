//
//  RaiderIO+RaidingHallOfFame.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//

import Foundation

extension RaiderIO {

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
        switch try await client.getApiV1RaidingHalloffame(query: .init(
            raid: try convert(from: raid),
            difficulty: try convert(from: difficulty),
            region: try convert(from: region)
        )) {
        case .ok(let ok):
            guard let hallOfFame = try ok.body.json.hallOfFame else {
                throw RaiderIOError.typeConversionFailure
            }
            return try HallOfFame(hallOfFame)
        case .undocumented(let statusCode, _):
            throw RaiderIOError.http(statusCode: statusCode)
        }
    }

}
