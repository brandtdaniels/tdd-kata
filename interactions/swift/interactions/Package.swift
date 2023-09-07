// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Interactions",
    products: [
        .executable(name: "scalc",
                    targets: ["SCalc"])
    ],
    dependencies: [
        .package(path: "../../../string-calculator/swift/StringCalculator"),
        .package(url: "https://github.com/Quick/Quick.git", from: "6.1.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "12.2.0")
    ],
    targets: [
        .target(
            name: "LoggingCalculator",
            dependencies: ["StringCalculator"]),
        .executableTarget(
            name: "SCalc",
            dependencies: ["LoggingCalculator"]),
        .testTarget(
            name: "LoggingCalculatorTests",
            dependencies: ["LoggingCalculator", "Quick", "Nimble"])
    ]
)
