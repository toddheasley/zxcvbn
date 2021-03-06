// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "zxcvbn",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13)
    ],
    products: [
        .library(name: "Zxcvbn", targets: [
                "Zxcvbn"
        ]),
        .executable(name: "zxcvbn-cli", targets: [
            "ZxcvbnCLI"
        ])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.3")
    ],
    targets: [
        .target(name: "Zxcvbn"),
        .executableTarget(name: "ZxcvbnCLI", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
            "Zxcvbn"
        ]),
        .testTarget(name: "ZxcvbnTests", dependencies: [
            "Zxcvbn"
        ])
    ]
)
