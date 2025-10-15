// swift-tools-version:5.10


import PackageDescription


let package = Package(
    name: "swift-raiderio",
    platforms: [
        .iOS(.v15),
        .macOS(.v13),
        .macCatalyst(.v15),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(name: "RaiderIO", targets: ["RaiderIO"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-generator", from: "1.10.3"),
        .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.8.3"),
        .package(url: "https://github.com/apple/swift-openapi-urlsession", from: "1.2.0"),
    ],
    targets: [
        .target(
            name: "RaiderIO",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession")
            ],
            plugins: [
                .plugin(
                    name: "OpenAPIGenerator",
                    package: "swift-openapi-generator"
                )
            ]
        ),
        .testTarget(name: "RaiderIOTests", dependencies: ["RaiderIO"]),
    ]
)
