// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Refactoring",
    products: [
        .library(
            name: "Refactoring",
            targets: ["Refactoring"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "6.1.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "12.2.0")
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
