// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "SendBirdCalls",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "SendBirdCalls",
            targets: ["SendBirdCallsTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/sendbird/sendbird-webrtc-ios", "1.9.0"..<"1.10.0")
    ],
    targets: [
        .binaryTarget(
            name: "SendBirdCalls",
            url: "https://github.com/sendbird/sendbird-calls-ios/releases/download/1.11.1/SendBirdCalls.xcframework.zip",
            checksum: "d3d7b3370c969c4e7a1c78931365fb74a2576118362a9520f7f607c150d6aec9"
        ),
        .target(name: "SendBirdCallsTarget",
                dependencies: [
                    .target(name: "SendBirdCalls"),
                    .product(name: "WebRTC", package: "sendbird-webrtc-ios")
                ],
                path: "Sources"),
        .testTarget(
            name: "sendbird-calls-iosTests",
            dependencies: ["SendBirdCallsTarget"]),
    ]
)
