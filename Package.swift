// swift-tools-version:4.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Metacompilers",
    products: [
        .executable(name: "Runner", targets: ["Runner"]),
        .library(name: "Metacompilers", targets: ["Metacompilers"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Runner",
            dependencies: ["Metacompilers"]),
        .target(
            name: "Metacompilers",
            dependencies: []),
        .testTarget(
            name: "MetacompilersTests",
            dependencies: ["Metacompilers"])
    ]
)
