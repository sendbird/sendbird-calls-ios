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
            url: "https://github.com/sendbird/sendbird-calls-ios/releases/download/1.12.3/SendBirdCalls.xcframework.zip",
            checksum: "7db20ef0185f4e0982f9b1fc6b9dd52452e48e0d66d5385915a8116c1476ced8"
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
