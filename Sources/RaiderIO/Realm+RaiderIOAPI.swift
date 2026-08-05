//
//  Realm+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension Realm {

    // `FullRealm` and `ConnectedRealm` are structurally-identical schemas the generator emits
    // as distinct Swift types (one per endpoint context) - see update-openapi-definition.sh's
    // notes on schema duplication. Both mark every property optional even though the live API
    // always sends the identity fields; treat a missing one as a genuine decode failure.

    init(_ apiModel: Components.Schemas.FullRealm) throws {
        guard let id = apiModel.id,
              let connectedRealmId = apiModel.connectedRealmId,
              let name = apiModel.name,
              let slug = apiModel.slug,
              let altSlug = apiModel.altSlug,
              let locale = apiModel.locale,
              let isConnected = apiModel.isConnected
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            id: id,
            connectedRealmId: connectedRealmId,
            name: name,
            altName: apiModel.altName,
            slug: slug,
            altSlug: altSlug,
            locale: locale,
            isConnected: isConnected
        )
    }

    // `RealmSummary` is a smaller, non-identical schema (no slug/altSlug/locale/isConnected at
    // all) used where only minimal guild-adjacent realm info is available (e.g. race-progression
    // entries). Fall back to empty/false rather than failing the whole decode over realm metadata
    // that isn't core to that data.
    init(_ apiModel: Components.Schemas.RealmSummary) {
        self.init(
            id: apiModel.id,
            connectedRealmId: apiModel.connectedRealmId,
            name: apiModel.name,
            altName: apiModel.altName,
            slug: "",
            altSlug: "",
            locale: "",
            isConnected: false
        )
    }

    init(_ apiModel: Components.Schemas.ConnectedRealm) throws {
        guard let id = apiModel.id,
              let connectedRealmId = apiModel.connectedRealmId,
              let name = apiModel.name,
              let slug = apiModel.slug,
              let altSlug = apiModel.altSlug,
              let locale = apiModel.locale,
              let isConnected = apiModel.isConnected
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            id: id,
            connectedRealmId: connectedRealmId,
            name: name,
            altName: apiModel.altName,
            slug: slug,
            altSlug: altSlug,
            locale: locale,
            isConnected: isConnected
        )
    }

}
