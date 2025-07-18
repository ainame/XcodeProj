// swift-tools-version:6.1.0

import PackageDescription

let package = Package(
    name: "XcodeProj",
    products: [
        .library(name: "XcodeProj", targets: ["XcodeProj"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tadija/AEXML.git", .upToNextMinor(from: "4.7.0")),
        .package(url: "https://github.com/ainame/PathKit.git", revision: "81ea782"),
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
