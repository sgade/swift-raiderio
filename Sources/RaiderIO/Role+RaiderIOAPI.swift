//
//  Role+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension Role {

    init(_ apiModel: Components.Schemas.Role) {
        switch apiModel {
        case .tank: self = .tank
        case .healer: self = .healer
        case .dps: self = .dps
        }
    }

}
