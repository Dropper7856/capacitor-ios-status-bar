// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorIosStatusBar",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CapacitorIosStatusBar",
            targets: ["IOSStatusBarPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "IOSStatusBarPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/IOSStatusBarPlugin"),
        .testTarget(
            name: "IOSStatusBarPluginTests",
            dependencies: ["IOSStatusBarPlugin"],
            path: "ios/Tests/IOSStatusBarPluginTests")
    ]
)