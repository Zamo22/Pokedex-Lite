// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Components",
    platforms: [
      .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Components",
            targets: ["Components"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm", .upToNextMajor(from: "4.0.0"))
    ],
    targets: [
        .target(
            name: "Components",
            dependencies: [
                .product(name: "Lottie", package: "lottie-spm")],
            resources: [.copy("Loadable/pokeballLoading.lottie")]),
        .testTarget(
            name: "ComponentsTests",
            dependencies: ["Components"]),
    ]
)
