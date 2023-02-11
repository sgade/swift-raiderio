//
//  RaiderIO+IconURL.swift
//  RaiderIO
//
//  Created by Sören Gade on 17.01.23.
//

import Foundation

extension RaiderIO {

    private static let iconCDNBaseUrl = URL(string: "https://cdnassets.raider.io/images/wow/icons/medium/")!

    public func iconUrl(with iconName: String) -> URL {
        Self.iconCDNBaseUrl
            .appendingPathComponent(iconName)
            .appendingPathExtension(".jpg")
    }

}
