//
//  HallOfFame+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension HallOfFame {

    init(_ apiModel: Components.Schemas.HallOfFame) throws {
        self.init(
            bossKills: try (apiModel.bossKills ?? []).map(BossKill.init),
            winningGuilds: try (apiModel.winningGuilds ?? []).map(WinningGuild.init)
        )
    }

}

extension HallOfFame.BossKill {

    init(_ apiModel: Components.Schemas.HallOfFameBossKill) throws {
        guard let boss = apiModel.boss,
            let bossSummary = apiModel.bossSummary,
            let defeatedBy = apiModel.defeatedBy,
            let attemptedBy = apiModel.attemptedBy
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            boss: boss,
            bossSummary: try BossSummary(bossSummary),
            bossKillVideo: try apiModel.bossKillVideo?.value1?.map(Video.init),
            defeatedAt: try DefeatedBy(defeatedBy),
            attemptedBy: try AttemptedBy(attemptedBy)
        )
    }

}

extension HallOfFame.BossKill.BossSummary {

    init(_ apiModel: Components.Schemas.BossSummary) throws {
        guard let encounterId = apiModel.encounterId,
            let name = apiModel.name,
            let slug = apiModel.slug,
            let ordinal = apiModel.ordinal,
            let wingId = apiModel.wingId,
            let iconUrl = apiModel.iconUrl
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(encounterId: encounterId, name: name, slug: slug, ordinal: ordinal, wingId: wingId, iconUrl: iconUrl)
    }

}

extension HallOfFame.BossKill.Video {

    init(_ apiModel: Components.Schemas.Video) throws {
        guard let type = apiModel._type, let id = apiModel.id else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(type: type, id: id)
    }

}

extension HallOfFame.BossKill.DefeatedBy {

    init(_ apiModel: Components.Schemas.DefeatedBy) throws {
        guard let totalCount = apiModel.totalCount else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(totalCount: totalCount, guilds: try (apiModel.guilds ?? []).map(KillGuild.init))
    }

}

extension HallOfFame.BossKill.AttemptedBy {

    init(_ apiModel: Components.Schemas.AttemptedBy) throws {
        guard let totalCount = apiModel.totalCount else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(totalCount: totalCount, attempts: try (apiModel.attempts ?? []).map(KillGuild.init))
    }

}

extension HallOfFame.WinningGuild {

    init(_ apiModel: Components.Schemas.HallOfFameGuildEntry) throws {
        guard let rank = apiModel.rank, let guild = apiModel.guild else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            rank: rank,
            guild: try Guild(guild),
            encountersDefated: try (apiModel.encountersDefeated ?? []).map(DefeatedEncounter.init),
            streamers: try apiModel.streamers.map(Streamers.init),
            recruitmentProfiles: try (apiModel.recruitmentProfiles ?? []).map(RecruitmentProfile.init)
        )
    }

}

extension KillGuild {

    /// Backs `DefeatedBy.guilds`/`AttemptedBy.attempts` - no `defeatedAt` at this position.
    init(_ apiModel: Components.Schemas.DefeatedByGuild) throws {
        guard let guild = apiModel.guild else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            guild: try Guild(guild),
            rank: apiModel.rank,
            encountersDefeated: try apiModel.encountersDefeated.map { try $0.map(DefeatedEncounter.init) }
        )
    }

    /// Backs `AttemptedBy.attempts` (a distinct-but-identically-shaped schema from `DefeatedByGuild`).
    init(_ apiModel: Components.Schemas.AttemptGuild) throws {
        guard let guild = apiModel.guild else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            guild: try Guild(guild),
            rank: apiModel.rank,
            encountersDefeated: try apiModel.encountersDefeated.map { try $0.map(DefeatedEncounter.init) }
        )
    }

}
