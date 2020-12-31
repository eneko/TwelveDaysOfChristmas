// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TwelveDaysOfChristmas",
    platforms: [.macOS(.v10_11)],
    dependencies: [],
    targets: [
        .target(
            name: "TwelveDaysOfChristmas",
            dependencies: []),
        .testTarget(
            name: "TwelveDaysOfChristmasTests",
            dependencies: ["TwelveDaysOfChristmas"]),
    ]
)
