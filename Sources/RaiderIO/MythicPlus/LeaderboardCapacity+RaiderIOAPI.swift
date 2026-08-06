//
//  LeaderboardCapacity+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension LeaderboardCapacity {

    init(_ apiModel: Components.Schemas.RealmListing) throws {
        guard let region = apiModel.region, let affixes = apiModel.affixes, let realms = apiModel.realms else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            region: Region(region),
            affixes: try affixes.map(Affix.init),
            realms: try realms.map(RealmInfo.init)
        )
    }

}

extension LeaderboardCapacity.Affix {

    init(_ apiModel: Components.Schemas.LeaderboardAffix) throws {
        guard let id = apiModel.id, let name = apiModel.name, let description = apiModel.description,
            let icon = apiModel.icon
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            id: id,
            icon: icon,
            name: Self.localized(
                en: name.en, ru: name.ru, ko: name.ko, cn: name.cn, pt: name.pt,
                it: name.it, fr: name.fr, es: name.es, de: name.de, tw: name.tw),
            description: Self.localized(
                en: description.en, ru: description.ru, ko: description.ko,
                cn: description.cn, pt: description.pt, it: description.it,
                fr: description.fr, es: description.es, de: description.de,
                tw: description.tw)
        )
    }

    /// Builds a `[locale: value]` dictionary from a fixed-property schema struct
    /// (`LocalizedString`/`LocalizedString1` don't model this as an `additionalProperties` map -
    /// they have one named, optional property per locale instead), omitting locales that are nil.
    private static func localized(
        en: String?, ru: String?, ko: String?, cn: String?, pt: String?,
        it: String?, fr: String?, es: String?, de: String?, tw: String?
    ) -> [String: String] {
        var result: [String: String] = [:]
        if let en { result["en"] = en }
        if let ru { result["ru"] = ru }
        if let ko { result["ko"] = ko }
        if let cn { result["cn"] = cn }
        if let pt { result["pt"] = pt }
        if let it { result["it"] = it }
        if let fr { result["fr"] = fr }
        if let es { result["es"] = es }
        if let de { result["de"] = de }
        if let tw { result["tw"] = tw }
        return result
    }

}

extension LeaderboardCapacity.RealmInfo {

    init(_ apiModel: Components.Schemas.RealmCapacityEntry) throws {
        guard let id = apiModel.id, let connectedRealms = apiModel.connectedRealms, let dungeons = apiModel.dungeons
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            id: id,
            connectedRealms: try connectedRealms.map(Realm.init),
            dungeons: try dungeons.map(DungeonInfo.init)
        )
    }

}

extension LeaderboardCapacity.RealmInfo.DungeonInfo {

    init(_ apiModel: Components.Schemas.RealmDungeonCapacity) throws {
        guard let dungeon = apiModel.dungeon else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(dungeion: try Dungeon(dungeon), lowest: try apiModel.lowest.map(LowestDungeonRun.init))
    }

}

extension LeaderboardCapacity.RealmInfo.DungeonInfo.LowestDungeonRun {

    init(_ apiModel: Components.Schemas.LeaderboardLowest) throws {
        guard let rank = apiModel.rank, let mythicLevel = apiModel.mythicLevel,
            let timeInMilliseconds = apiModel.timeInMilliseconds
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(rank: rank, mythicLevel: mythicLevel, timeInMilliseconds: timeInMilliseconds)
    }

}
