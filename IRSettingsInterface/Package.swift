// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IRSettingsInterface",
    defaultLocalization: "en",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "IRSettingsInterface",
            targets: ["IRSettingsInterface"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "IRSettingsInterface",
            dependencies: [
                
            ]
        ),
    ]
)
