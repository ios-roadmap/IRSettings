// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IRSettings",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "IRSettings",
            targets: ["IRSettings"]
        ),
    ],
    targets: [
        .target(
            name: "IRSettings",
            dependencies: []
        )
    ]
)

