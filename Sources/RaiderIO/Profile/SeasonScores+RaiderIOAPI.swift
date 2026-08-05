//
//  SeasonScores+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension SeasonScores {

    init(_ apiModel: Components.Schemas.MythicPlusScoresBySeason) {
        self.init(
            season: apiModel.season,
            scores: ScoreOverview(apiModel.scores),
            segments: [
                "all": SegmentScore(apiModel.segments.all),
                "dps": SegmentScore(apiModel.segments.dps),
                "healer": SegmentScore(apiModel.segments.healer),
                "tank": SegmentScore(apiModel.segments.tank),
                "spec_0": SegmentScore(apiModel.segments.spec0),
                "spec_1": SegmentScore(apiModel.segments.spec1),
                "spec_2": SegmentScore(apiModel.segments.spec2),
                "spec_3": SegmentScore(apiModel.segments.spec3)
            ]
        )
    }

}

extension SeasonScores.ScoreOverview {

    init(_ apiModel: Components.Schemas.MythicPlusScores) {
        self.init(
            all: SeasonScores.ScoreValue(apiModel.all),
            dps: SeasonScores.ScoreValue(apiModel.dps),
            healer: SeasonScores.ScoreValue(apiModel.healer),
            tank: SeasonScores.ScoreValue(apiModel.tank),
            spec0: SeasonScores.ScoreValue(apiModel.spec0),
            spec1: SeasonScores.ScoreValue(apiModel.spec1),
            spec2: SeasonScores.ScoreValue(apiModel.spec2),
            spec3: SeasonScores.ScoreValue(apiModel.spec3)
        )
    }

}

extension SeasonScores.SegmentScore {

    init(_ apiModel: Components.Schemas.ScoreColorSegment) {
        self.init(score: SeasonScores.ScoreValue(apiModel.score), color: apiModel.color)
    }

}
