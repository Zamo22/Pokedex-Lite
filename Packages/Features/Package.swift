// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [
      .iOS(.v16)
    ],
    products: [
        .library(
            name: "Features",
            targets: ["Features"]),
    ],
    dependencies: [
        .package(path: "./Packages/DependencyContainer"),
        .package(path: "./Packages/Networking"),
        .package(path: "./Packages/Components"),
        .package(path: "./Packages/Core"),
        .package(path: "./Packages/TestUtils")
    ],
    targets: [
        .target(
            name: "Features",
            dependencies: ["DependencyContainer", "Networking", "Core"]),
        .testTarget(
            name: "FeaturesTests",
            dependencies: ["Features", "TestUtils"]),
    ]
)
