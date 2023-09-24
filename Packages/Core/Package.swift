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
        .package(path: "./Packages/DependencyContainer")
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                "DependencyContainer"
            ]),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]),
    ]
)
