// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
      .iOS(.v15)
    ],
    products: [
        .library(
            name: "Core",
            targets: ["Core"]),
    ],
    dependencies: [
        .package(path: "./Packages/DependencyContainer"),
        .package(path: "./Packages/Networking"),
        .package(path: "./Packages/Components")
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                "DependencyContainer",
                "Networking",
                "Components"
            ]),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]),
    ]
)
