// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "DependencyContainer",
    products: [
        .library(
            name: "DependencyContainer",
            targets: ["DependencyContainer"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DependencyContainer",
            dependencies: []),
        .testTarget(
            name: "DependencyContainerTests",
            dependencies: ["DependencyContainer"]),
    ]
)
