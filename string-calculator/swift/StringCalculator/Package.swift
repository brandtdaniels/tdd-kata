// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StringCalculator",
    products: [
        .library(
            name: "StringCalculator",
            targets: ["StringCalculator"]),
    ],
    targets: [
        .target(
            name: "StringCalculator"),
        .testTarget(
            name: "StringCalculatorTests",
            dependencies: ["StringCalculator"]),
    ]
)
