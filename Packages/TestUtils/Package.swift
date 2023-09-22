// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "TestUtils",
    products: [
        .library(
            name: "TestUtils",
            targets: ["TestUtils"]),
    ],
    dependencies: [
        .package(path: "./Packages/DependencyContainer")
    ],
    targets: [
        .target(
            name: "TestUtils",
            dependencies: ["DependencyContainer"]),
    ]
)
