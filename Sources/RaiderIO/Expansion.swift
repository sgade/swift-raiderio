//
//  Expansion.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public enum Expansion: Int {

    case legion             = 6
    case battleForAzeroth   = 7
    case shadowlands        = 8

}

// MARK: - Decodable

extension Expansion: Decodable {}
