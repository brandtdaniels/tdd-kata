// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GameOfLife",
    products: [
        .library(
            name: "GameOfLife",
            targets: ["GameOfLife"]),
    ],
    targets: [
        .target(
            name: "GameOfLife"),
        .testTarget(
            name: "GameOfLifeTests",
            dependencies: ["GameOfLife"]),
    ]
)
