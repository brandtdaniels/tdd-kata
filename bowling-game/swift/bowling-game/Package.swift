// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "BowlingGame",
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "BowlingGame",
            dependencies: []),
        .testTarget(
            name: "BowlingGameTests",
            dependencies: ["BowlingGame"])
    ]
)
