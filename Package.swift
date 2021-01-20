// swift-tools-version:5.1
import PackageDescription

#if os(Linux)
let libraryType: PackageDescription.Product.Library.LibraryType = .dynamic
#else
let libraryType: PackageDescription.Product.Library.LibraryType = .static
#endif

let package = Package(
    name: "sjeng",
    products: [
        .executable(
            name: "sjeng",
            targets: ["sjeng"]
        ),
        .library(
            name: "Chess",
            type: libraryType,
            targets: ["Chess"]
        )
    ],
    dependencies: [
        // GDBM
    ],
    targets: [
        .target(
            name: "sjeng",
            dependencies: [
                "CSjeng"
            ]
        ),
        .target(
            name: "Chess",
            dependencies: [
                "CSjeng"
            ]
        ),
        .target(
            name: "CSjeng"
        )
    ],
    cLanguageStandard: .gnu89
)
