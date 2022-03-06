//
//  RecruitmentProfile.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//


import Foundation


public struct RecruitmentProfile {

    public let activityType: String
    public let entityType: String
    public let recruitmentProfileId: Int

    public init(activityType: String, entityType: String, recruitmentProfileId: Int) {
        self.activityType = activityType
        self.entityType = entityType
        self.recruitmentProfileId = recruitmentProfileId
    }

}

// MARK: - Decodable

extension RecruitmentProfile: Decodable {

    private enum CodingKeys: String, CodingKey {

        case activityType           = "activity_type"
        case entityType             = "entity_type"
        case recruitmentProfileId   = "recruitment_profile_id"

    }

}
