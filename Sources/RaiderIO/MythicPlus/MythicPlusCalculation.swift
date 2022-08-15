//
//  MythicPlusCalculation.swift
//  RaiderIO
//
//  Created by Sören Gade on 16.08.22.
//

import Foundation

public enum MythicPlusCalculation {

    public typealias Rating = MythicPlusScore

    public static let betterRunMultiplier = 1.5
    public static let worseRunMultiplier = 0.5

    /// Calculates the total mythic+ rating for the dungeon based on the given runs.
    ///
    /// The two dungeon runs should be for the same dungeon. Otherwise, the meaning of the rating is void.
    /// In addition, it is expected that the two runs are not from the same week cycle, meaning one is for
    /// Tyrannical and one is for the Fortified affix.
    public static func totalRating(run1: DungeonRun, run2: DungeonRun?) -> Rating {
#if DEBUG
        if let run2 = run2 {
            assert(run1.dungeon == run2.dungeon, "Calculating total rating for runs in different dungeons.")
            assert(!run1.affixes.isEmpty)
            assert(!run2.affixes.isEmpty)
            assert(run1.affixes[0].name != run2.affixes[0].name, "Calculating total rating for runs from the same week cycle.")
        }
#endif
        return totalRating(score1: run1.score, score2: run2?.score)
    }

    public static func totalRating(score1: MythicPlusScore, score2: MythicPlusScore?) -> Rating {
        guard let score2 = score2 else {
            return Rating(score1.value * Self.betterRunMultiplier)
        }

        // we could call `rating(for:alternateRun:)` here, but this is faster
        let betterScore = max(score1.value, score2.value)
        let worseScore = min(score1.value, score2.value)
        return Rating(betterScore * Self.betterRunMultiplier + worseScore * Self.worseRunMultiplier)
    }

    /// Calculates the mythic+ rating for the dungeon run.
    ///
    /// Calculation is based on the alternate run. If none is given, the rating will always be given
    /// for being the best run.
    ///
    /// - Parameters:
    ///     - run: The run to calculate the rating for.
    ///     - alternateRun: Best run on the other week (for the affixes Tyrannical and Fortified), if any.
    /// - Returns: The calculated rating for the given run.
    public static func rating(for run: DungeonRun, alternateRun: DungeonRun? = nil) -> Rating {
        guard let alternateRun = alternateRun,
              run.score < alternateRun.score
        else {
            return run.score * Self.betterRunMultiplier
        }

        return run.score * Self.worseRunMultiplier
    }

}
