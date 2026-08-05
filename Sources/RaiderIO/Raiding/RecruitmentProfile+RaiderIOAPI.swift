//
//  RecruitmentProfile+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension RecruitmentProfile {

    init(_ apiModel: Components.Schemas.RecruitmentProfile) throws {
        guard let activityType = apiModel.activityType,
              let entityType = apiModel.entityType,
              let recruitmentProfileId = apiModel.recruitmentProfileId
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(activityType: activityType, entityType: entityType, recruitmentProfileId: recruitmentProfileId)
    }

}
