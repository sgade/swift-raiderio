//
//  BossRanking.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//


import Foundation


public struct BossRanking {

    public struct Realm {

        public let id: Int
        public let connectedRealmId: Int
        public let name: String
        public let altName: String?
        public let slug: String
        public let altSlug: String
        public let locale: String
        public let isConnected: Bool

    }

    public struct Guild {

        public let id: Int
        public let name: String
        public let faction: Faction
        public let realm: Realm
        public let region: Region
        public let path: String

    }

    public struct DefeatedEncounter {

        public let slug: String
        public let lastDefeated: ISO8601Date
        public let firstDefeated: ISO8601Date

    }

    public let rank: Int
    public let regionRank: Int
    public let guild: Guild
    public let encountersDefeated: [DefeatedEncounter]
    public let streamers: Streamers
    public let recruitmentProfiles: [RecruitmentProfile]
    public let itemLevelAvg: Float

}


public struct Streamers {

    public let count: Int
//    public let stream: Any?

}


public struct RecruitmentProfile {

    public let activityType: String
    public let entityType: String
    public let recruitmentProfileId: Int

}

// MARK: - Decodable

extension BossRanking: Decodable {}

extension BossRanking.Realm: Decodable {}

extension BossRanking.Guild: Decodable {}

extension BossRanking.DefeatedEncounter: Decodable {}


extension Streamers: Decodable {}


extension RecruitmentProfile: Decodable {

    private enum CodingKeys: String, CodingKey {

        case activityType           = "activity_type"
        case entityType             = "entity_type"
        case recruitmentProfileId   = "recruitment_profile_id"

    }

}
