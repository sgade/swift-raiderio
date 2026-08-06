//
//  Character+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension Character {

    init(_ apiModel: Components.Schemas.Character) throws {
        guard let name = apiModel.name,
            let race = apiModel.race,
            let apiClass = apiModel._class,
            let spec = apiModel.spec,
            let realm = apiModel.realm,
            let region = apiModel.region
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            id: apiModel.id,
            name: name,
            race: try Race(race),
            class: try Class(apiClass),
            spec: try Specialization(spec),
            talentLoadout: try apiModel.talentLoadout.map(TalentLoadout.init),
            gender: try apiModel.gender.map(Gender.init),
            thumbnail: apiModel.thumbnail,
            itemLevelEquipped: apiModel.itemLevelEquipped.map(Float.init),
            artifactTraits: apiModel.artifactTraits.map(Float.init),
            realm: try Realm(realm),
            region: Region(region),
            items: try apiModel.items.map(Items.init),
            recruitmentProfiles: try (apiModel.recruitmentProfiles ?? []).map(RecruitmentProfile.init)
        )
    }

}

extension Character.Specialization {

    init(_ apiModel: Components.Schemas.Spec1) throws {
        guard let id = apiModel.id, let name = apiModel.name, let slug = apiModel.slug, let role = apiModel.role
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            id: Int(id),
            name: name,
            slug: slug,
            classId: apiModel.classId,
            role: try Role(string: role),
            isMelee: apiModel.isMelee ?? false
        )
    }

}

extension Character.TalentLoadout {

    init(_ apiModel: Components.Schemas.TalentLoadout) throws {
        guard let specId = apiModel.specId, let loadoutText = apiModel.loadoutText else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            specId: specId,
            loadout: try (apiModel.loadout ?? []).map(Loadout.init),
            loadoutText: loadoutText
        )
    }

}

extension Character.TalentLoadout.Loadout {

    init(_ apiModel: Components.Schemas.TalentLoadoutNode) throws {
        guard let entryIndex = apiModel.entryIndex, let rank = apiModel.rank else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(entryIndex: entryIndex, rank: rank)
    }

}

extension Character.Items {

    init(_ apiModel: Components.Schemas.ItemsContainer) throws {
        self.init(
            itemLevelEquipped: Float(apiModel.itemLevelEquipped ?? 0),
            artifactTraits: Float(apiModel.artifactTraits ?? 0),
            items: try Equipment(apiModel.items)
        )
    }

}

extension Character.Items.Equipment {

    init(_ apiModel: Components.Schemas.Items?) throws {
        func item(_ slot: Components.Schemas.EquippedItem?) throws -> Item? {
            try slot.map(Item.init)
        }

        self.init(
            head: try item(apiModel?.head),
            neck: try item(apiModel?.neck),
            shoulder: try item(apiModel?.shoulder),
            back: try item(apiModel?.back),
            chest: try item(apiModel?.chest),
            waist: try item(apiModel?.waist),
            wrist: try item(apiModel?.wrist),
            hands: try item(apiModel?.hands),
            legs: try item(apiModel?.legs),
            feet: try item(apiModel?.feet),
            finger1: try item(apiModel?.finger1),
            finger2: try item(apiModel?.finger2),
            trinket1: try item(apiModel?.trinket1),
            trinket2: try item(apiModel?.trinket2),
            mainhand: try item(apiModel?.mainhand),
            offhand: try item(apiModel?.offhand)
        )
    }

}

extension Character.Items.Equipment.Item {

    init(_ apiModel: Components.Schemas.EquippedItem) throws {
        self.init(
            id: apiModel.itemId,
            itemLevel: apiModel.itemLevel,
            icon: apiModel.icon,
            name: apiModel.name,
            itemQuality: try Quality(apiModel.itemQuality),
            isLegendary: apiModel.isLegendary,
            tier: apiModel.tier,
            gems: apiModel.gems,
            bonuses: apiModel.bonuses
        )
    }

}
