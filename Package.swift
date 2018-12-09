// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "ledTest2",
	 dependencies: [
        // Dependencies declare other packages that this package depends on.
        .Package(url: "https://github.com/uraimo/SwiftyGPIO.git", majorVersion: 1)
    ]
)
