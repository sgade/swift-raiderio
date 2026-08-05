//
//  Affix+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import Foundation
import RaiderIOAPI

extension Affix {

    init(_ apiModel: Components.Schemas.Affix) {
        self.init(
            id: apiModel.id,
            name: apiModel.name,
            description: apiModel.description,
            icon: apiModel.icon,
            wowheadUrl: URL(string: apiModel.wowheadUrl)
        )
    }

    /// `AffixDetail` is a distinct (and slightly smaller) schema than `Affix` used specifically by
    /// the region-affixes response.
    init(_ apiModel: Components.Schemas.AffixDetail) {
        self.init(
            id: Int(apiModel.id),
            name: apiModel.name,
            description: apiModel.description,
            icon: apiModel.icon ?? "",
            wowheadUrl: URL(string: apiModel.wowheadUrl)
        )
    }

    /// `RunAffix` is a distinct, smaller schema (no `wowhead_url`, every field optional) used by
    /// the mythic-plus runs response's `weekly_modifiers`.
    init(_ apiModel: Components.Schemas.RunAffix) throws {
        guard let id = apiModel.id, let name = apiModel.name, let description = apiModel.description else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(id: id, name: name, description: description, icon: apiModel.icon ?? "", wowheadUrl: nil)
    }

}
