// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Data-FastHex",
    products: [
        .library(
            name: "Data-FastHex",
            targets: ["Data-FastHex"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Data-FastHex",
            dependencies: ["Data-FastHex_ObjC"]
        ),
        .target(
            name: "Data-FastHex_ObjC",
            dependencies: []
        ),
        .testTarget(
            name: "Data-FastHex_Tests",
            dependencies: ["Data-FastHex"]
        ),
        .testTarget(
            name: "Data-FastHex_TestsObjC",
            dependencies: ["Data-FastHex_ObjC"]
        ),
    ]
)
