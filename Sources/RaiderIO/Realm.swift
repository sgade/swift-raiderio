//
//  Realm.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//

import Foundation

public struct Realm {

    public let id: Int
    public let connectedRealmId: Int
    public let name: String
    public let altName: String?
    public let slug: String
    public let altSlug: String
    public let locale: String
    public let isConnected: Bool

    public init(id: Int,
                connectedRealmId: Int,
                name: String,
                altName: String? = nil,
                slug: String,
                altSlug: String,
                locale: String,
                isConnected: Bool) {
        self.id = id
        self.connectedRealmId = connectedRealmId
        self.name = name
        self.altName = altName
        self.slug = slug
        self.altSlug = altSlug
        self.locale = locale
        self.isConnected = isConnected
    }

}

// MARK: - Codable

extension Realm: Codable {}
