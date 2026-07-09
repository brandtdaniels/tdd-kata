// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Refactoring",
    products: [
        .library(
            name: "Refactoring",
            targets: ["Refactoring"]),
    ],
    targets: [
        .target(
            name: "Refactoring"),
        .testTarget(
            name: "RefactoringTests",
            dependencies: ["Refactoring"]),
    ]
)
