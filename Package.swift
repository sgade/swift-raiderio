// swift-tools-version:5.5


import PackageDescription


let package = Package(
    name: "swift-raiderio",
    products: [
        .library(name: "swift-raiderio", targets: ["RaiderIO"]),
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
