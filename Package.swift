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
            url: "https://github.com/sendbird/sendbird-calls-ios/releases/download/1.12.1/SendBirdCalls.xcframework.zip",
            checksum: "35d14939982c911fa7bf241b0e5946e2f2c53a8c62795ce557eb882a579c3952"
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
