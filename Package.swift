// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AndyLawlerSite",
    platforms: [.macOS(.v14)],
    dependencies: [
        // Ignite is pre-1.0 and minor releases can break things, so pin an exact
        // version and update on purpose.
        .package(url: "https://github.com/Ignite-Swift/Ignite.git", exact: "0.7.2")
    ],
    targets: [
        .executableTarget(
            name: "AndyLawlerSite",
            dependencies: ["Ignite"]
        )
    ]
)
