// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BowlingGame",
    products: [
        .library(
            name: "BowlingGame",
            targets: ["BowlingGame"]),
    ],
    targets: [
        .target(
            name: "BowlingGame"),
        .testTarget(
            name: "BowlingGameTests",
            dependencies: ["BowlingGame"]),
    ]
)
