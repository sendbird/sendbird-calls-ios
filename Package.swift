// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SendBirdCalls",
    platforms: [.iOS(.v8)],
    products: [
        .library(
            name: "SendBirdCalls",
            targets: ["SendBirdCallsTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/sendbird/sendbird-webrtc-ios", .branch("swift-package-manager"))
    ],
    targets: [
        .binaryTarget(name: "SendBirdCalls", path: "SendBirdCalls.xcframework"),
        .target(name: "SendBirdCallsTarget",
                dependencies: [
                    .target(name: "SendBirdCalls"),
                    .product(name: "SendBirdWebRTC", package: "sendbird-webrtc-ios")
                ],
                path: "Sources"),
        .testTarget(
            name: "sendbird-calls-iosTests",
            dependencies: ["SendBirdCallsTarget"]),
    ]
)
