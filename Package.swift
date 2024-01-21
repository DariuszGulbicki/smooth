// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Smooth",
    products: [
        .library(
            name: "Queueing",
            targets: ["Queueing"]),
        .library(
            name: "Structures",
            targets: ["Structures"]),
        .library(
            name: "Pathfinding",
            targets: ["Pathfinding"]),
        .library(
            name: "Templating",
            targets: ["Templating"]),
        .library(
            name: "StringUtils",
            targets: ["StringUtils"]),
        .library(
            name: "Encoding",
            targets: ["Encoding"]),
    ],
    dependencies: [
        .package(url: "https://github.com/DariuszGulbicki/Logging-Camp.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/DariuszGulbicki/Colorizer.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .target(
            name: "Structures",
            dependencies: []),
        .target(
            name: "Queueing",
            dependencies: []),
        .target(
            name: "Templating",
            dependencies: []),
        .target(
            name: "Pathfinding",
            dependencies: [
                .product(name: "LoggingCamp", package: "Logging-Camp"),
                "Queueing",
                "Structures"
            ]),
        .target(
            name: "StringUtils",
            dependencies: []),
        .target(
            name: "Encoding",
            dependencies: []),
    ]
)
