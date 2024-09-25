// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Smooth",
    products: [
        .library(
            name: "Basis",
            targets: ["Basis"]),
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
        .library(
            name: "Concurrency",
            targets: ["Concurrency"]),
        .library(
            name: "Caching",
            targets: ["Caching"]
            )
    ],
    dependencies: [
        .package(url: "https://github.com/DariuszGulbicki/Logging-Camp.git", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/DariuszGulbicki/Colorizer.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .target(
            name: "Basis",
            dependencies: [
                .product(name: "LoggingCamp", package: "Logging-Camp"),
            ]),
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
        .target(
            name: "Concurrency",
            dependencies: []),
        .target(
            name: "Caching",
            dependencies: []),
        .testTarget(
            name: "SmoothTests",
            dependencies: ["Basis", "Structures", "Queueing", "Templating", "Pathfinding", "StringUtils", "Encoding", "Concurrency"]),
    ]
)
