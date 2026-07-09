// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Interactions",
    products: [
        .library(
            name: "Interactions",
            targets: ["Interactions"]),
    ],
    targets: [
        .target(
            name: "Interactions"),
        .testTarget(
            name: "InteractionsTests",
            dependencies: ["Interactions"]),
    ]
)
