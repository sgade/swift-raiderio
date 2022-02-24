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

}

// MARK: - Decodable

extension Realm: Decodable {}
