import XCTest
@testable import RaiderIO

final class RaiderIOTests: XCTestCase {

    var client: RaiderIO?

    override func setUp() {
        client = RaiderIO(urlSession: .shared)
    }

    func testFetchProfile() async throws {
        do {
            let profile = try await client!.getProfile(region: .eu, realm: "Frostwolf", name: "Kiaro", fields: ProfileField.allCases)
            print(profile)
        } catch {
            print(error)
            throw error
        }
    }

}
