// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IRSettingsLibrary",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "IRSettingsLibrary",
            targets: ["IRSettingsLibrary"]),
    ],
    dependencies: [
        .package(name: "IRSettingsInterface", path: "../IRSettingsInterface")
    ],
    targets: [
        .target(
            name: "IRSettingsLibrary",
            dependencies: [
                "IRSettingsInterface"
            ]
        ),

    ]
)
