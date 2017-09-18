import FBSnapshotTestCase

protocol ImagesDirectoryProviding {
    var directory: String { get }
}

class ImagesDirectoryProvider: ImagesDirectoryProviding {

    init(environment: [String: String] = ProcessInfo.processInfo.environment,
         suffixes: NSOrderedSet = FBSnapshotTestCaseDefaultSuffixes()) {
        self.environment = environment
        self.suffixes = suffixes
    }

    var directory: String {
        return [referenceDirectory, suffixes.firstObject].flatMap { $0 as? String }.joined()
    }

    // MARK: - Private

    private let environment: [String: String]
    private let suffixes: NSOrderedSet

    private var referenceDirectory: String {
        return environment["FB_REFERENCE_IMAGE_DIR"] ?? "ReferenceImages"
    }

}
