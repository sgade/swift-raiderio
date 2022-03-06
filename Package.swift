// swift-tools-version:5.5


import PackageDescription


let package = Package(
    name: "swift-raiderio",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .macCatalyst(.v15),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(name: "RaiderIO", targets: ["RaiderIO"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(name: "RaiderIO", dependencies: []),
        .testTarget(name: "RaiderIOTests", dependencies: ["RaiderIO"]),
    ]
)
