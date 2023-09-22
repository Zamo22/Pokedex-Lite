// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [
      .iOS(.v15)
    ],
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"]),
    ],
    dependencies: [
        .package(path: "./Packages/DependencyContainer")
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: ["DependencyContainer"]),
        .testTarget(
            name: "NetworkingTests",
            dependencies: ["Networking"]),
    ]
)
