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
        .package(url: "https://github.com/sendbird/sendbird-webrtc-ios", "1.10.0"..<"1.11.0")
    ],
    targets: [
        .binaryTarget(
            name: "SendBirdCalls",
            url: "https://github.com/sendbird/sendbird-calls-ios/releases/download/1.12.2/SendBirdCalls.xcframework.zip",
            checksum: "114425c9b998ee05f4891f9dabb1f84e55d5ae83931c7aa7216f9cd99280c9c9"
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
