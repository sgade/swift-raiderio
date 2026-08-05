//
//  Faction+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension Faction {

    init(_ apiModel: Components.Schemas.Faction) {
        switch apiModel {
        case .alliance: self = .alliance
        case .horde: self = .horde
        }
    }

}
