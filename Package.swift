// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SwiftSyntaxPlus",
    products: [
        .library(
            name: "SwiftSyntaxPlus",
            targets: ["SwiftSyntaxPlus"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git",
                 from: "509.0.0-swift-DEVELOPMENT-SNAPSHOT-2023-06-05-a"),
    ],
    targets: [
        .target(
            name: "SwiftSyntaxPlus",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax")
            ]
        ),
        .testTarget(
            name: "SwiftSyntaxPlusTests",
            dependencies: ["SwiftSyntaxPlus"]
        ),
    ]
)
