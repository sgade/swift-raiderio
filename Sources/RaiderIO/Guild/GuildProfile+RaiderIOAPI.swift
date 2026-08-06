//
//  GuildProfile+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import Foundation
import RaiderIOAPI

extension GuildProfile {

    init(_ apiModel: Components.Schemas.ViewGuildProfileResponse) throws {
        guard let profileUrl = URL(string: apiModel.profileUrl) else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            name: apiModel.name,
            faction: Faction(apiModel.faction),
            region: RegionSlug(apiModel.region),
            realm: apiModel.realm,
            profileUrl: profileUrl,
            raidRankings: apiModel.raidRankings.map(GuildProfile.RaidRanking.dictionary(from:)),
            raidProgression: apiModel.raidProgression.map(RaidProgression.dictionary(from:))
        )
    }

}

extension GuildProfile.RaidRanking {

    init(_ apiModel: Components.Schemas.RaidDifficultyRankings) {
        self.init(
            normal: apiModel.normal.map(Ranks.init),
            heroic: apiModel.heroic.map(Ranks.init),
            mythic: apiModel.mythic.map(Ranks.init)
        )
    }

    /// Builds a dictionary keyed by raid slug from a fixed-property schema struct (same shape as
    /// `RaidProgression.dictionary(from:)` - see there for why this isn't an `additionalProperties` map).
    static func dictionary(from apiModel: Components.Schemas.RaidRankings) -> [String: GuildProfile.RaidRanking] {
        var result: [String: GuildProfile.RaidRanking] = [:]
        if let v = apiModel.theTideboundGrotto { result["the-tidebound-grotto"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.theVenomousAbyss { result["the-venomous-abyss"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.sporefall { result["sporefall"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.tierMn1 { result["tier-mn-1"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.manaforgeOmega { result["manaforge-omega"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.liberationOfUndermine { result["liberation-of-undermine"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.nerubarPalace { result["nerubar-palace"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.blackrockDepths { result["blackrock-depths"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.awakenedAmirdrassilTheDreamsHope {
            result["awakened-amirdrassil-the-dreams-hope"] = GuildProfile.RaidRanking(v)
        }
        if let v = apiModel.awakenedAberrusTheShadowedCrucible {
            result["awakened-aberrus-the-shadowed-crucible"] = GuildProfile.RaidRanking(v)
        }
        if let v = apiModel.awakenedVaultOfTheIncarnates {
            result["awakened-vault-of-the-incarnates"] = GuildProfile.RaidRanking(v)
        }
        if let v = apiModel.amirdrassilTheDreamsHope {
            result["amirdrassil-the-dreams-hope"] = GuildProfile.RaidRanking(v)
        }
        if let v = apiModel.aberrusTheShadowedCrucible {
            result["aberrus-the-shadowed-crucible"] = GuildProfile.RaidRanking(v)
        }
        if let v = apiModel.vaultOfTheIncarnates { result["vault-of-the-incarnates"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.fatedSepulcherOfTheFirstOnes {
            result["fated-sepulcher-of-the-first-ones"] = GuildProfile.RaidRanking(v)
        }
        if let v = apiModel.fatedSanctumOfDomination {
            result["fated-sanctum-of-domination"] = GuildProfile.RaidRanking(v)
        }
        if let v = apiModel.fatedCastleNathria { result["fated-castle-nathria"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.sepulcherOfTheFirstOnes {
            result["sepulcher-of-the-first-ones"] = GuildProfile.RaidRanking(v)
        }
        if let v = apiModel.sanctumOfDomination { result["sanctum-of-domination"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.castleNathria { result["castle-nathria"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.nyalothaTheWakingCity { result["nyalotha-the-waking-city"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.theEternalPalace { result["the-eternal-palace"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.crucibleOfStorms { result["crucible-of-storms"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.battleOfDazaralor { result["battle-of-dazaralor"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.uldir { result["uldir"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.antorusTheBurningThrone {
            result["antorus-the-burning-throne"] = GuildProfile.RaidRanking(v)
        }
        if let v = apiModel.tombOfSargeras { result["tomb-of-sargeras"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.theNighthold { result["the-nighthold"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.trialOfValor { result["trial-of-valor"] = GuildProfile.RaidRanking(v) }
        if let v = apiModel.theEmeraldNightmare { result["the-emerald-nightmare"] = GuildProfile.RaidRanking(v) }
        return result
    }

}
