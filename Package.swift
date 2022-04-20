// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "SendBirdCalls",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "SendBirdCalls",
            targets: ["SendBirdCallsTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/sendbird/sendbird-webrtc-ios", from: "1.5.0")
    ],
    targets: [
        .binaryTarget(name: "SendBirdCalls", path: "SendBirdCalls.xcframework"),
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
