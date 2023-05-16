//
//  ExtendedDungeonRun.swift
//  RaiderIO
//
//  Created by Sören Gade on 17.01.23.
//

import Foundation

public struct ExtendedDungeonRun {

    public let season: String
    public let status: String
    public let dungeon: Dungeon
    public let keystoneRunId: Int
    public let mythicLevel: Int
    public let clearTime: Milliseconds
    public let keystoneTime: Milliseconds
    public let completedAt: ISO8601Date
    public let numberOfChests: Int
    public let timeRemaining: Milliseconds
    public let loggedRunId: Int?
    public let weeklyModifiers: [Affix]
    public let numberOfActiveModifiers: Int
    public let faction: GroupFaction
    public let deletedAt: ISO8601Date?
    public let score: MythicPlusScore
    public let loggedDetails: Details?
    public let keystoneTeamId: Int
    public let keystonePlatoonId: Int?
    public let isTournamentProfile: Bool
    public let roster: [Participant]
    public let loggedSources: [LoggingSource]

    public init(season: String,
                status: String,
                dungeon: Dungeon,
                keystoneRunId: Int,
                mythicLevel: Int,
                clearTime: Milliseconds,
                keystoneTime: Milliseconds,
                completedAt: ISO8601Date,
                numberOfChests: Int,
                timeRemaining: Milliseconds,
                loggedRunId: Int?,
                weeklyModifiers: [Affix],
                numberOfActiveModifiers: Int,
                faction: GroupFaction,
                deletedAt: ISO8601Date?,
                score: MythicPlusScore,
                loggedDetails: Details?,
                keystoneTeamId: Int,
                keystonePlatoonId: Int?,
                isTournamentProfile: Bool,
                roster: [Participant],
                loggedSources: [LoggingSource]) {
        self.season = season
        self.status = status
        self.dungeon = dungeon
        self.keystoneRunId = keystoneRunId
        self.mythicLevel = mythicLevel
        self.clearTime = clearTime
        self.keystoneTime = keystoneTime
        self.completedAt = completedAt
        self.numberOfChests = numberOfChests
        self.timeRemaining = timeRemaining
        self.loggedRunId = loggedRunId
        self.weeklyModifiers = weeklyModifiers
        self.numberOfActiveModifiers = numberOfActiveModifiers
        self.faction = faction
        self.deletedAt = deletedAt
        self.score = score
        self.loggedDetails = loggedDetails
        self.keystoneTeamId = keystoneTeamId
        self.keystonePlatoonId = keystonePlatoonId
        self.isTournamentProfile = isTournamentProfile
        self.roster = roster
        self.loggedSources = loggedSources
    }

}

// MARK: - Details

extension ExtendedDungeonRun {

    public struct Details {

        public let totalEnemyForces: Int
        public let deaths: [Death]
        public let encounters: [Encounter]
        public let enemies: [Enemy]

        public init(totalEnemyForces: Int, deaths: [Death], encounters: [Encounter], enemies: [Enemy]) {
            self.totalEnemyForces = totalEnemyForces
            self.deaths = deaths
            self.encounters = encounters
            self.enemies = enemies
        }

    }

}

extension ExtendedDungeonRun.Details {

    public struct Death {

        public let loggedEncounterId: Int?
        public let characterId: Int
        public let approximateDiedAt: Int

        public init(loggedEncounterId: Int?, characterId: Int, approximateDiedAt: Int) {
            self.loggedEncounterId = loggedEncounterId
            self.characterId = characterId
            self.approximateDiedAt = approximateDiedAt
        }

    }

}

extension ExtendedDungeonRun.Details {

    public struct Encounter {

        public let id: Int
        public let status: String
        public let pullStartedAt: ISO8601Date
        public let pullEndedAt: ISO8601Date
        public let duration: Milliseconds
        public let isSuccess: Bool
        public let approximateRelativeStartedAt: Int
        public let approximateRelativeEndedAt: Int
        public let boss: Boss
        public let roster: [Character]

        public init(id: Int,
                    status: String,
                    pullStartedAt: ISO8601Date,
                    pullEndedAt: ISO8601Date,
                    duration: Milliseconds,
                    isSuccess: Bool,
                    approximateRelativeStartedAt: Int,
                    approximateRelativeEndedAt: Int,
                    boss: Boss,
                    roster: [Character]) {
            self.id = id
            self.status = status
            self.pullStartedAt = pullStartedAt
            self.pullEndedAt = pullEndedAt
            self.duration = duration
            self.isSuccess = isSuccess
            self.approximateRelativeStartedAt = approximateRelativeStartedAt
            self.approximateRelativeEndedAt = approximateRelativeEndedAt
            self.boss = boss
            self.roster = roster
        }

    }

}

extension ExtendedDungeonRun.Details.Encounter {

    public struct Boss {

        public let encounterId: Int
        public let name: String
        public let slug: String
        public let ordinal: Int
        public let wingId: Int
        public let iconUrl: String

        public init(encounterId: Int, name: String, slug: String, ordinal: Int, wingId: Int, iconUrl: String) {
            self.encounterId = encounterId
            self.name = name
            self.slug = slug
            self.ordinal = ordinal
            self.wingId = wingId
            self.iconUrl = iconUrl
        }

    }

}

extension ExtendedDungeonRun.Details {

    public struct Enemy {

        public let name: String
        public let enemyForcesValue: Int
        public let finishedAt: ISO8601Date
        public let npcId: Int
        public let count: Int
        public let startedAt: ISO8601Date
        public let approximateRelativeEndedAt: Int

        public init(name: String,
                    enemyForcesValue: Int,
                    finishedAt: ISO8601Date,
                    npcId: Int,
                    count: Int,
                    startedAt: ISO8601Date,
                    approximateRelativeEndedAt: Int) {
            self.name = name
            self.enemyForcesValue = enemyForcesValue
            self.finishedAt = finishedAt
            self.npcId = npcId
            self.count = count
            self.startedAt = startedAt
            self.approximateRelativeEndedAt = approximateRelativeEndedAt
        }

    }

}

// MARK: - Participant

extension ExtendedDungeonRun {

    public struct Participant {

        public let character: Character
        public let oldCharacter: Character?
        public let isTransfer: Bool
        public let guild: Guild?
        public let role: Role
        public let items: Character.Items
        public let ranks: Ranks

    }

}

// MARK: - LoggingSource

extension ExtendedDungeonRun {

    public struct LoggingSource {

        // Profile information
        public let name: String?
        public let avatar: String?
        // Character information
        public let characterName: String?
        public let anonymized: Bool?

        public init(
            name: String?,
            avatar: String?,
            characterName: String?,
            anonymized: Bool?
        ) {
            self.name = name
            self.avatar = avatar
            self.characterName = characterName
            self.anonymized = anonymized
        }

    }

}

// MARK: - Codable

extension ExtendedDungeonRun: Codable {

    private enum CodingKeys: String, CodingKey {

        case season
        case status
        case dungeon
        case keystoneRunId              = "keystone_run_id"
        case mythicLevel                = "mythic_level"
        case clearTime                  = "clear_time_ms"
        case keystoneTime               = "keystone_time_ms"
        case completedAt                = "completed_at"
        case numberOfChests             = "num_chests"
        case timeRemaining              = "time_remaining_ms"
        case loggedRunId                = "logged_run_id"
        case weeklyModifiers            = "weekly_modifiers"
        case numberOfActiveModifiers    = "num_modifiers_active"
        case faction
        case deletedAt                  = "deleted_at"
        case score
        case loggedDetails              = "logged_details"
        case keystoneTeamId             = "keystone_team_id"
        case keystonePlatoonId          = "keystone_platoon_id"
        case isTournamentProfile
        case roster
        case loggedSources

    }

}

extension ExtendedDungeonRun.Details: Codable {

    private enum CodingKeys: String, CodingKey {

        case totalEnemyForces   = "total_enemy_forces"
        case deaths
        case encounters
        case enemies

    }

}

extension ExtendedDungeonRun.Details.Death: Codable {

    private enum CodingKeys: String, CodingKey {

        case loggedEncounterId  = "logged_encounter_id"
        case characterId        = "character_id"
        case approximateDiedAt  = "approximate_died_at"

    }

}

extension ExtendedDungeonRun.Details.Encounter: Codable {

    private enum CodingKeys: String, CodingKey {

        case id
        case status
        case pullStartedAt                  = "pull_started_at"
        case pullEndedAt                    = "pull_ended_at"
        case duration                       = "duration_ms"
        case isSuccess                      = "is_success"
        case approximateRelativeStartedAt   = "approximate_relative_started_at"
        case approximateRelativeEndedAt     = "approximate_relative_ended_at"
        case boss
        case roster

    }

}

extension ExtendedDungeonRun.Details.Encounter.Boss: Codable {}

extension ExtendedDungeonRun.Details.Enemy: Codable {

    private enum CodingKeys: String, CodingKey {

        case name
        case enemyForcesValue           = "enemy_forces_value"
        case finishedAt                 = "finished_at"
        case npcId                      = "npc_id"
        case count
        case startedAt                  = "started_at"
        case approximateRelativeEndedAt = "approximate_relative_ended_at"

    }

}

extension ExtendedDungeonRun.Participant: Codable {}

extension ExtendedDungeonRun.LoggingSource: Codable {}
