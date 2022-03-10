//
//  Character.swift
//  RaiderIO
//
//  Created by Sören Gade on 10.03.22.
//


import Foundation


public struct Character {

    public struct Covenant {

        public struct Soulbind {

            public struct Trait {

                public let id: Int
                public let spell: Spell

                public init(id: Int, spell: Spell) {
                    self.id = id
                    self.spell = spell
                }

            }

            public struct Conduit {

                public let id: Int
                public let spell: Spell
                public let rank: Int

                public init(id: Int, spell: Spell, rank: Int) {
                    self.id = id
                    self.spell = spell
                    self.rank = rank
                }

            }

            public let id: Int
            public let name: String
            public let slug: String
            public let covenantId: Int
            public let traits: [Trait]
            public let conduits: [Conduit]

            public init(id: Int, name: String, slug: String, covenantId: Int, traits: [Trait], conduits: [Conduit]) {
                self.id = id
                self.name = name
                self.slug = slug
                self.covenantId = covenantId
                self.traits = traits
                self.conduits = conduits
            }

        }

        public let id: Int
        public let name: String
        public let icon: String
        public let soulbind: Soulbind

        public init(id: Int, name: String, icon: String, soulbind: Soulbind) {
            self.id = id
            self.name = name
            self.icon = icon
            self.soulbind = soulbind
        }

    }

    public struct Specialization {

        public let id: Int
        public let name: String
        public let slug: String
        public let classId: Int
        public let role: Role
        public let isMelee: Bool

        public init(id: Int, name: String, slug: String, classId: Int, role: Role, isMelee: Bool) {
            self.id = id
            self.name = name
            self.slug = slug
            self.classId = classId
            self.role = role
            self.isMelee = isMelee
        }

    }

    public struct TalentDetail {

        public let specId: Int
        public let icon: String
        public let spellId: Int
        public let classId: Int
        public let tierId: Int
        public let columnId: Int

        public init(specId: Int, icon: String, spellId: Int, classId: Int, tierId: Int, columnId: Int) {
            self.specId = specId
            self.icon = icon
            self.spellId = spellId
            self.classId = classId
            self.tierId = tierId
            self.columnId = columnId
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
                public let isAzeriteArmor: Bool
                //public let azeritePowers: [Any] // cant determine type without documentation or concrete types
                public let corruption: Corruption
                public let dominationShards: [DominationShard]
                public let gems: [Int]
                public let bonuses: [Int]

                public init(id: Int,
                            itemLevel: Int,
                            icon: String,
                            name: String,
                            itemQuality: Quality,
                            isLegendary: Bool,
                            isAzeriteArmor: Bool,
                            corruption: Corruption,
                            dominationShards: [DominationShard],
                            gems: [Int],
                            bonuses: [Int]) {
                    self.id = id
                    self.itemLevel = itemLevel
                    self.icon = icon
                    self.name = name
                    self.itemQuality = itemQuality
                    self.isLegendary = isLegendary
                    self.isAzeriteArmor = isAzeriteArmor
                    self.corruption = corruption
                    self.dominationShards = dominationShards
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

            public init(head: Item? = nil,
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
                        offhand: Item? = nil) {
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
        public let corruption: Corruption
        public let items: Equipment

        public init(itemLevelEquipped: Float, artifactTraits: Float, corruption: Corruption, items: Equipment) {
            self.itemLevelEquipped = itemLevelEquipped
            self.artifactTraits = artifactTraits
            self.corruption = corruption
            self.items = items
        }

    }

    public let id: Int
    public let covenant: Covenant
    public let name: String
    public let race: Race
    public let `class`: Class
    public let spec: Specialization
    public let talents: String
    public let talentsDetails: [TalentDetail]?
    public let gender: Gender
    public let thumbnail: String
    public let itemLevelTotal: Float
    public let itemLevelEquipped: Float
    public let artifactTraits: Float
    public let realm: Realm
    public let region: Region
    public let items: Items
    public let recruitmentProfiles: [RecruitmentProfile]

    public init(id: Int,
                covenant: Covenant,
                name: String,
                race: Race,
                class: Class,
                spec: Specialization,
                talents: String,
                talentsDetails: [TalentDetail]? = nil,
                gender: Gender,
                thumbnail: String,
                itemLevelTotal: Float,
                itemLevelEquipped: Float,
                artifactTraits: Float,
                realm: Realm,
                region: Region,
                items: Items,
                recruitmentProfiles: [RecruitmentProfile]) {
        self.id = id
        self.covenant = covenant
        self.name = name
        self.race = race
        self.class = `class`
        self.spec = spec
        self.talents = talents
        self.talentsDetails = talentsDetails
        self.gender = gender
        self.thumbnail = thumbnail
        self.itemLevelTotal = itemLevelTotal
        self.itemLevelEquipped = itemLevelEquipped
        self.artifactTraits = artifactTraits
        self.realm = realm
        self.region = region
        self.items = items
        self.recruitmentProfiles = recruitmentProfiles
    }

}

// MARK: - Decodable

extension Character: Decodable {

    private enum OuterCodingKeys: String, CodingKey {

        case character

    }

    private enum CodingKeys: String, CodingKey {

        case id
        case covenant
        case name
        case race
        case `class`
        case spec
        case talents
        case talentsDetails
        case gender
        case thumbnail
        case itemLevelTotal
        case itemLevelEquipped
        case artifactTraits
        case realm
        case region
        case items
        case recruitmentProfiles

    }

    public init(from decoder: Decoder) throws {
        let outerContainer = try decoder.container(keyedBy: OuterCodingKeys.self)
        let container = try outerContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .character)

        id = try container.decode(Int.self, forKey: .id)
        covenant = try container.decode(Covenant.self, forKey: .covenant)
        name = try container.decode(String.self, forKey: .name)
        race = try container.decode(Race.self, forKey: .race)
        `class` = try container.decode(Class.self, forKey: .class)
        spec = try container.decode(Specialization.self, forKey: .spec)
        talents = try container.decode(String.self, forKey: .talents)
        talentsDetails = try container.decode([TalentDetail].self, forKey: .talentsDetails)
        gender = try container.decode(Gender.self, forKey: .gender)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
        itemLevelTotal = try container.decode(Float.self, forKey: .itemLevelTotal)
        itemLevelEquipped = try container.decode(Float.self, forKey: .itemLevelEquipped)
        artifactTraits = try container.decode(Float.self, forKey: .artifactTraits)
        realm = try container.decode(Realm.self, forKey: .realm)
        region = try container.decode(Region.self, forKey: .region)
        items = try container.decode(Items.self, forKey: .items)
        recruitmentProfiles = try container.decode([RecruitmentProfile].self, forKey: .recruitmentProfiles)
    }

}


extension Character.Covenant: Decodable {}
extension Character.Covenant.Soulbind: Decodable {}
extension Character.Covenant.Soulbind.Conduit: Decodable {}
extension Character.Covenant.Soulbind.Trait: Decodable {}

extension Character.Specialization: Decodable {

    private enum CodingKeys: String, CodingKey {

        case id
        case name
        case slug
        case classId    = "class_id"
        case role
        case isMelee    = "is_melee"

    }

}

extension Character.TalentDetail: Decodable {}

extension Character.Items: Decodable {

    private enum CodingKeys: String, CodingKey {

        case itemLevelEquipped  = "item_level_equipped"
        case artifactTraits     = "artifact_traits"
        case corruption
        case items

    }

}
extension Character.Items.Equipment: Decodable {}
extension Character.Items.Equipment.Item: Decodable {

    private enum CodingKeys: String, CodingKey {

        case id                 = "item_id"
        case itemLevel          = "item_level"
        case icon
        case name
        case itemQuality        = "item_quality"
        case isLegendary        = "is_legendary"
        case isAzeriteArmor     = "is_azerite_armor"
        case corruption
        case dominationShards   = "domination_shards"
        case gems
        case bonuses

    }

}