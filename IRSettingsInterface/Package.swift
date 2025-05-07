// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IRSettingsInterface",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .tvOS(.v18),
        .watchOS(.v11),
        .visionOS(.v2)
    ],
    products: [
        .library(
            name: "IRSettingsInterface",
            targets: ["IRSettingsInterface"]),
    ],
    dependencies: [
        .package(name: "IRCore", path: "../../../Packages/IRCore"),
    ],
    targets: [
        .target(
            name: "IRSettingsInterface",
            dependencies: [
                "IRCore",
            ]
        ),
    ]
)
