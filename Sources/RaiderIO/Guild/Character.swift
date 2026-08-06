//
//  Character.swift
//  RaiderIO
//
//  Created by Sören Gade on 10.03.22.
//

import Foundation

// swiftlint:disable file_length
// swiftlint:disable type_body_length
public struct Character {

    public struct Specialization {

        public let id: Int
        public let name: String
        public let slug: String
        public let classId: Int?
        public let role: Role
        public let isMelee: Bool

        public init(id: Int, name: String, slug: String, classId: Int?, role: Role, isMelee: Bool) {
            self.id = id
            self.name = name
            self.slug = slug
            self.classId = classId
            self.role = role
            self.isMelee = isMelee
        }

    }

    /// The talent loadout starting with Dragonflight.
    public struct TalentLoadout {

        public struct Loadout {

            public struct Node {

                public struct Entry {

                    public let id: Int
                    public let type: Int
                    public let maxRanks: Int
                    public let spell: Spell

                }

                public let id: Int
                public let treeId: Int
                public let type: Int
                public let entries: [Entry]
                public let important: Bool
                public let positionX: Int
                public let positionY: Int
                public let row: Int
                public let column: Int

            }

            public let entryIndex: Int
            public let rank: Int

        }

        public let specId: Int
        public let loadout: [Loadout]
        public let loadoutText: String

        public init(specId: Int, loadout: [Loadout], loadoutText: String) {
            self.specId = specId
            self.loadout = loadout
            self.loadoutText = loadoutText
        }

    }

    public struct Items {

        public struct Equipment {

            public struct Item {

                public let id: Int
                public let itemLevel: Int
                public let icon: String
                public let name: String
                public let itemQuality: Quality
                public let isLegendary: Bool
                public let tier: String?
                public let gems: [Int]
                public let bonuses: [Int]

                public init(
                    id: Int,
                    itemLevel: Int,
                    icon: String,
                    name: String,
                    itemQuality: Quality,
                    isLegendary: Bool,
                    tier: String?,
                    gems: [Int],
                    bonuses: [Int]
                ) {
                    self.id = id
                    self.itemLevel = itemLevel
                    self.icon = icon
                    self.name = name
                    self.itemQuality = itemQuality
                    self.isLegendary = isLegendary
                    self.tier = tier
                    self.gems = gems
                    self.bonuses = bonuses
                }

            }

            public let head: Item?
            public let neck: Item?
            public let shoulder: Item?
            public let back: Item?
            public let chest: Item?
            public let waist: Item?
            public let wrist: Item?
            public let hands: Item?
            public let legs: Item?
            public let feet: Item?
            public let finger1: Item?
            public let finger2: Item?
            public let trinket1: Item?
            public let trinket2: Item?
            public let mainhand: Item?
            public let offhand: Item?

            public init(
                head: Item? = nil,
                neck: Item? = nil,
                shoulder: Item? = nil,
                back: Item? = nil,
                chest: Item? = nil,
                waist: Item? = nil,
                wrist: Item? = nil,
                hands: Item? = nil,
                legs: Item? = nil,
                feet: Item? = nil,
                finger1: Item? = nil,
                finger2: Item? = nil,
                trinket1: Item? = nil,
                trinket2: Item? = nil,
                mainhand: Item? = nil,
                offhand: Item? = nil
            ) {
                self.head = head
                self.neck = neck
                self.shoulder = shoulder
                self.back = back
                self.chest = chest
                self.waist = waist
                self.wrist = wrist
                self.hands = hands
                self.legs = legs
                self.feet = feet
                self.finger1 = finger1
                self.finger2 = finger2
                self.trinket1 = trinket1
                self.trinket2 = trinket2
                self.mainhand = mainhand
                self.offhand = offhand
            }

        }

        public let itemLevelEquipped: Float
        public let artifactTraits: Float
        public let items: Equipment

        public init(itemLevelEquipped: Float, artifactTraits: Float, items: Equipment) {
            self.itemLevelEquipped = itemLevelEquipped
            self.artifactTraits = artifactTraits
            self.items = items
        }

    }

    public let id: Int?
    public let name: String
    public let race: Race
    public let `class`: Class
    public let spec: Specialization
    public let talentLoadout: TalentLoadout?
    public let gender: Gender?
    public let thumbnail: String?
    public let itemLevelEquipped: Float?
    public let artifactTraits: Float?
    public let realm: Realm
    public let region: Region
    public let items: Items?
    public let recruitmentProfiles: [RecruitmentProfile]

    public init(
        id: Int?,
        name: String,
        race: Race,
        class: Class,
        spec: Specialization,
        talentLoadout: TalentLoadout?,
        gender: Gender?,
        thumbnail: String?,
        itemLevelEquipped: Float?,
        artifactTraits: Float?,
        realm: Realm,
        region: Region,
        items: Items?,
        recruitmentProfiles: [RecruitmentProfile]
    ) {
        self.id = id
        self.name = name
        self.race = race
        self.class = `class`
        self.spec = spec
        self.talentLoadout = talentLoadout
        self.gender = gender
        self.thumbnail = thumbnail
        self.itemLevelEquipped = itemLevelEquipped
        self.artifactTraits = artifactTraits
        self.realm = realm
        self.region = region
        self.items = items
        self.recruitmentProfiles = recruitmentProfiles
    }

}
// swiftlint:enable type_body_length

// MARK: - Codable

extension Character: Codable {

    private enum OuterCodingKeys: String, CodingKey {

        case character

    }

    private enum CodingKeys: String, CodingKey {

        case id
        case name
        case race
        case `class`
        case spec
        case talentLoadout
        case gender
        case thumbnail
        case itemLevelEquipped
        case artifactTraits
        case realm
        case region
        case items
        case recruitmentProfiles

    }

    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<CodingKeys>
        do {
            let outerContainer = try decoder.container(keyedBy: OuterCodingKeys.self)
            container = try outerContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .character)
        } catch DecodingError.keyNotFound {
            container = try decoder.container(keyedBy: CodingKeys.self)
        }

        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        race = try container.decode(Race.self, forKey: .race)
        `class` = try container.decode(Class.self, forKey: .class)
        spec = try container.decode(Specialization.self, forKey: .spec)
        talentLoadout = try container.decodeIfPresent(TalentLoadout.self, forKey: .talentLoadout)
        gender = try container.decodeIfPresent(Gender.self, forKey: .gender)
        thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail)
        itemLevelEquipped = try container.decodeIfPresent(Float.self, forKey: .itemLevelEquipped)
        artifactTraits = try container.decodeIfPresent(Float.self, forKey: .artifactTraits)
        realm = try container.decode(Realm.self, forKey: .realm)
        region = try container.decode(Region.self, forKey: .region)
        items = try container.decodeIfPresent(Items.self, forKey: .items)
        recruitmentProfiles = try container.decode([RecruitmentProfile].self, forKey: .recruitmentProfiles)
    }

    public func encode(to encoder: Encoder) throws {
        var outerContainer = encoder.container(keyedBy: OuterCodingKeys.self)
        var container = outerContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .character)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(race, forKey: .race)
        try container.encode(`class`, forKey: .class)
        try container.encode(spec, forKey: .spec)
        try container.encodeIfPresent(talentLoadout, forKey: .talentLoadout)
        try container.encodeIfPresent(gender, forKey: .gender)
        try container.encodeIfPresent(thumbnail, forKey: .thumbnail)
        try container.encodeIfPresent(itemLevelEquipped, forKey: .itemLevelEquipped)
        try container.encodeIfPresent(artifactTraits, forKey: .artifactTraits)
        try container.encode(realm, forKey: .realm)
        try container.encode(region, forKey: .region)
        try container.encodeIfPresent(items, forKey: .items)
        try container.encode(recruitmentProfiles, forKey: .recruitmentProfiles)
    }

}

extension Character.Specialization: Codable {

    private enum CodingKeys: String, CodingKey {

        case id
        case name
        case slug
        case classId = "class_id"
        case role
        case isMelee = "is_melee"

    }

}

extension Character.TalentLoadout: Codable {}
extension Character.TalentLoadout.Loadout: Codable {}
extension Character.TalentLoadout.Loadout.Node: Codable {

    private enum CodingKeys: String, CodingKey {

        case id
        case treeId
        case type
        case entries
        case important
        case positionX = "posX"
        case positionY = "posY"
        case row
        case column

    }

}
extension Character.TalentLoadout.Loadout.Node.Entry: Codable {}

extension Character.Items: Codable {

    private enum CodingKeys: String, CodingKey {

        case itemLevelEquipped = "item_level_equipped"
        case artifactTraits = "artifact_traits"
        case items

    }

}

extension Character.Items.Equipment: Codable {}

extension Character.Items.Equipment.Item: Codable {

    private enum CodingKeys: String, CodingKey {

        case id = "item_id"
        case itemLevel = "item_level"
        case icon
        case name
        case itemQuality = "item_quality"
        case isLegendary = "is_legendary"
        case tier
        case gems
        case bonuses

    }

}
