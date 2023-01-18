//
//  DungeonRun+Id.swift
//  
//
//  Created by Sören Gade on 17.01.23.
//

import Foundation

extension DungeonRun {

    public var id: Int? {
        guard let lastPath = url.pathComponents.last,
              let idString = lastPath.split(separator: "-").first
        else {
            return nil
        }
        return Int(idString)
    }

}
