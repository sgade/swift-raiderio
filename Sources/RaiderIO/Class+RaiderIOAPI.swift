//
//  Class+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension Class {

    init(_ apiModel: Components.Schemas.Class) throws {
        guard let id = apiModel.id,
              let name = apiModel.name,
              let slug = apiModel.slug
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(id: Int(id), name: name, slug: try ClassSlug(slug))
    }

}
