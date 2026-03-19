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
            url: "https://github.com/sendbird/sendbird-calls-ios/releases/download/1.11.2/SendBirdCalls.xcframework.zip",
            checksum: "efd0e4f90f3c91f0e26d60bc68ef21d19dc49f6483f87b414f61d3593c5ca1dd"
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
