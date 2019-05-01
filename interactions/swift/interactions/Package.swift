// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Interactions",
    products: [
        .executable(name: "scalc",
                    targets: ["Scalc"])
    ],
    dependencies: [
        .package(url: "../../../string-calculator/swift/StringCalculator",
                 from: "1.0.0"),
        .package(url: "https://github.com/Quick/Quick.git",
                 from: "1.2.0"),
        .package(url: "https://github.com/Quick/Nimble.git",
                 from: "7.0.3")
    ],
    targets: [
        .target(
            name: "LoggingCalculator",
            dependencies: ["StringCalculator"]),
        .target(
            name: "Scalc",
            dependencies: ["LoggingCalculator"]),
        .testTarget(
            name: "LoggingCalculatorTests",
            dependencies: ["LoggingCalculator", "Quick", "Nimble"])
    ]
)
