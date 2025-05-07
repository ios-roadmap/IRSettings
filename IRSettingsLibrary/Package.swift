// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IRSettingsLibrary",
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
            name: "IRSettingsLibrary",
            targets: ["IRSettingsLibrary"]),
    ],
    dependencies: [
        .package(name: "IRCore", path: "../../../Packages/IRCore"),
        
        .package(name: "IRSettingsInterface", path: "../IRSettingsInterface"),
        .package(name: "IRProfileInterface", path: "../../IRProfile/IRProfileInterface"),
    ],
    targets: [
        .target(
            name: "IRSettingsLibrary",
            dependencies: [
                "IRCore",
                
                "IRSettingsInterface",
                "IRProfileInterface",
            ]
        ),

    ]
)
