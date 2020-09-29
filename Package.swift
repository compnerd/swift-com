// swift-tools-version:5.3

import PackageDescription

let SwiftCOM = Package(
  name: "SwiftCOM",
  products: [
    .library(name: "SwiftCOM", type: .dynamic, targets: ["SwiftCOM"]),
    .executable(name: "tlbgen", targets: ["TLBGen"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser",
             from: "0.0.1"),
  ],
  targets: [
    .target(name: "SwiftCOM", linkerSettings: [.linkedLibrary("Ole32")]),
    .target(
      name: "TLBGen",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
        "SwiftCOM",
      ],
      swiftSettings: [.unsafeFlags(["-parse-as-library"])])
  ]
)
