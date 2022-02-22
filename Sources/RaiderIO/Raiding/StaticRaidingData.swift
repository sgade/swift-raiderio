//
//  StaticRaidingData.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//


import Foundation


public struct StaticRaidingData {

    

    let raids: [Raid]

}

// MARK: - Decodable

extension StaticRaidingData: Decodable {}
