// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Refactoring",
    products: [
        .library(
            name: "Refactoring",
            targets: ["Refactoring"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git",
                 from: "1.2.0"),
        .package(url: "https://github.com/Quick/Nimble.git",
                 from: "7.0.3")
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
