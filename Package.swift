// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "DesignSystemUtils",
    platforms: [.iOS("13.0"), .macOS("10.15"), .tvOS("13.0"), .watchOS("8.0")],
    products: [
        .library(
            name: "DesignSystemUtils",
            targets: ["DesignSystemUtils"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DesignSystemUtils",
            dependencies: []),
        .testTarget(
            name: "DesignSystemUtilsTests",
            dependencies: ["DesignSystemUtils"]),
    ]
)
