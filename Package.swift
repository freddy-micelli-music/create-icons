// swift-tools-version: 5.9
import PackageDescription
let package = Package(name: "CreateIcons", platforms: [.macOS(.v14)], products: [.executable(name: "CreateIcons", targets: ["CreateIcons"])], targets: [.executableTarget(name: "CreateIcons", path: "Sources")])
