import Foundation

// swiftlint:disable all
import PathKit

// MARK: - Path extras.

// Remove systemGlob - using PathKit's cross-platform glob implementation instead

extension Path {
    /// Creates a directory
    ///
    /// - Throws: an errof if the directory cannot be created.
    func mkpath(withIntermediateDirectories: Bool) throws {
        try FileManager.default.createDirectory(atPath: string, withIntermediateDirectories: withIntermediateDirectories, attributes: nil)
    }

    /// Finds files and directories using the given glob pattern.
    ///
    /// - Parameter pattern: glob pattern.
    /// - Returns: found directories and files.
    func glob(_ pattern: String) -> [Path] {
        // Use PathKit's cross-platform glob implementation
        // PathKit's glob method is already available on Path instances
        let fullPattern = (self + pattern).string
        return Path.glob(fullPattern)
    }

    func relative(to path: Path) -> Path {
        let pathComponents = absolute().components
        let baseComponents = path.absolute().components

        var commonComponents = 0
        for (index, component) in baseComponents.enumerated() {
            if component != pathComponents[index] {
                break
            }
            commonComponents += 1
        }

        var resultComponents = Array(repeating: "..", count: baseComponents.count - commonComponents)
        resultComponents.append(contentsOf: pathComponents[commonComponents...])

        return Path(components: resultComponents)
    }
}

// swiftlint:enable all
