// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-argument-parser",
    platforms: [
        .macOS(.v10_10), .iOS(.v9),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "ArgumentParserKit",
            targets: ["ArgumentParserKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "ArgumentParserKit",
            dependencies: ["Libc","APUtility"]),
        
        .target(
            /** Shim target to import missing C headers in Darwin and Glibc modulemap. */
            name: "APUtility",
            dependencies: ["Libc"]),
        
        .target(
            /** Shim target to import missing C headers in Darwin and Glibc modulemap. */
            name: "clibc",
            dependencies: []),
        .target(
            /** Cross-platform access to bare `libc` functionality. */
            name: "Libc",
            dependencies: ["clibc"]),
        
        .target(
            /** Generic test support library */
            name: "TestSupport",
            dependencies: ["APUtility"]),
        .target(
            /** Test support executable */
            name: "TestSupportExecutable",
            dependencies: ["APUtility", "ArgumentParserKit"]),
        
        
        .testTarget(
            name: "swift-argument-parserTests",
            dependencies: ["ArgumentParserKit", "TestSupport", "TestSupportExecutable"]),
    ]
)
