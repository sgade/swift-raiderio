//
//  RaidProgression+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension RaidProgression {

    init(_ apiModel: Components.Schemas.RaidProgression) {
        self.init(
            summary: apiModel.summary,
            totalBosses: apiModel.totalBosses,
            normalBossesKilled: apiModel.normalBossesKilled,
            heroicBossesKilled: apiModel.heroicBossesKilled,
            mythicBossesKilled: apiModel.mythicBossesKilled
        )
    }

    /// Builds a dictionary keyed by raid slug from a fixed-property schema struct
    /// (`OverallRaidProgression` doesn't model this as an `additionalProperties` map - it has
    /// one named, optional property per raid slug instead).
    static func dictionary(from apiModel: Components.Schemas.OverallRaidProgression) -> [String: RaidProgression] {
        var result: [String: RaidProgression] = [:]
        if let v = apiModel.theTideboundGrotto { result["the-tidebound-grotto"] = RaidProgression(v) }
        if let v = apiModel.theVenomousAbyss { result["the-venomous-abyss"] = RaidProgression(v) }
        if let v = apiModel.sporefall { result["sporefall"] = RaidProgression(v) }
        if let v = apiModel.tierMn1 { result["tier-mn-1"] = RaidProgression(v) }
        if let v = apiModel.manaforgeOmega { result["manaforge-omega"] = RaidProgression(v) }
        if let v = apiModel.liberationOfUndermine { result["liberation-of-undermine"] = RaidProgression(v) }
        if let v = apiModel.nerubarPalace { result["nerubar-palace"] = RaidProgression(v) }
        if let v = apiModel.blackrockDepths { result["blackrock-depths"] = RaidProgression(v) }
        if let v = apiModel.awakenedAmirdrassilTheDreamsHope { result["awakened-amirdrassil-the-dreams-hope"] = RaidProgression(v) }
        if let v = apiModel.awakenedAberrusTheShadowedCrucible { result["awakened-aberrus-the-shadowed-crucible"] = RaidProgression(v) }
        if let v = apiModel.awakenedVaultOfTheIncarnates { result["awakened-vault-of-the-incarnates"] = RaidProgression(v) }
        if let v = apiModel.amirdrassilTheDreamsHope { result["amirdrassil-the-dreams-hope"] = RaidProgression(v) }
        if let v = apiModel.aberrusTheShadowedCrucible { result["aberrus-the-shadowed-crucible"] = RaidProgression(v) }
        if let v = apiModel.vaultOfTheIncarnates { result["vault-of-the-incarnates"] = RaidProgression(v) }
        if let v = apiModel.fatedSepulcherOfTheFirstOnes { result["fated-sepulcher-of-the-first-ones"] = RaidProgression(v) }
        if let v = apiModel.fatedSanctumOfDomination { result["fated-sanctum-of-domination"] = RaidProgression(v) }
        if let v = apiModel.fatedCastleNathria { result["fated-castle-nathria"] = RaidProgression(v) }
        if let v = apiModel.sepulcherOfTheFirstOnes { result["sepulcher-of-the-first-ones"] = RaidProgression(v) }
        if let v = apiModel.sanctumOfDomination { result["sanctum-of-domination"] = RaidProgression(v) }
        if let v = apiModel.castleNathria { result["castle-nathria"] = RaidProgression(v) }
        if let v = apiModel.nyalothaTheWakingCity { result["nyalotha-the-waking-city"] = RaidProgression(v) }
        if let v = apiModel.theEternalPalace { result["the-eternal-palace"] = RaidProgression(v) }
        if let v = apiModel.crucibleOfStorms { result["crucible-of-storms"] = RaidProgression(v) }
        if let v = apiModel.battleOfDazaralor { result["battle-of-dazaralor"] = RaidProgression(v) }
        if let v = apiModel.uldir { result["uldir"] = RaidProgression(v) }
        if let v = apiModel.antorusTheBurningThrone { result["antorus-the-burning-throne"] = RaidProgression(v) }
        if let v = apiModel.tombOfSargeras { result["tomb-of-sargeras"] = RaidProgression(v) }
        if let v = apiModel.theNighthold { result["the-nighthold"] = RaidProgression(v) }
        if let v = apiModel.trialOfValor { result["trial-of-valor"] = RaidProgression(v) }
        if let v = apiModel.theEmeraldNightmare { result["the-emerald-nightmare"] = RaidProgression(v) }
        return result
    }

}
