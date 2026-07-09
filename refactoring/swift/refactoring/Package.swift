// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Refactoring",
    products: [
        .library(
            name: "Refactoring",
            targets: ["Refactoring"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "7.6.2"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "14.0.0")
    ],
    targets: [
        .target(
            name: "Refactoring",
            dependencies: []),
        .testTarget(
            name: "RefactoringTests",
            dependencies: ["Refactoring", "Quick", "Nimble"]),
    ]
)
