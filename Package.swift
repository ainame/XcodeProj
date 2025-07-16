// swift-tools-version:6.0.0

import PackageDescription

let package = Package(
    name: "XcodeProj",
    products: [
        .library(name: "XcodeProj", targets: ["XcodeProj"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tadija/AEXML.git", .upToNextMinor(from: "4.7.0")),
        .package(url: "https://github.com/ainame/PathKit.git", .revision("03ce551397e2cd85d3e137fd1914ee68e6b9a642")),
    ],
    targets: [
        .target(name: "XcodeProj",
                dependencies: [
                    .product(name: "PathKit", package: "PathKit"),
                    .product(name: "AEXML", package: "AEXML"),
                ],
                swiftSettings: [
                    .enableExperimentalFeature("StrictConcurrency"),
                ]),
        .testTarget(name: "XcodeProjTests", dependencies: ["XcodeProj"]),
    ]
)
