// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AndyLawlerSite",
    platforms: [.macOS(.v14)],
    dependencies: [
        // Ignite is pre-1.0 and minor releases can break things, so pin an exact
        // version and update on purpose.
        .package(url: "https://github.com/Ignite-Swift/Ignite.git", exact: "0.7.2"),
        // Ignite depends on swift-collections. From 1.7.2 it needs Swift 6.4, but
        // GitHub's stable macOS runner has Swift 6.2, so cap it until the runner catches up.
        .package(url: "https://github.com/apple/swift-collections.git", "1.1.4"..<"1.7.2")
    ],
    targets: [
        .executableTarget(
            name: "AndyLawlerSite",
            dependencies: [
                "Ignite",
                .product(name: "Collections", package: "swift-collections")
            ]
        )
    ]
)
