//
//  Region.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public enum Region: String {

    case cn
    case eu
    case kr
    case tw
    case us

}

// MARK: - Codable

extension Region: Codable {}
