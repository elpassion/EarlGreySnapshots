//
//  Created by Mateusz Szklarek on 17/09/2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

import FBSnapshotTestCase

protocol ImageDirectoryProviding {
    var recordDirectory: String { get }
    var verifyDirectories: [String] { get }
}

class ImageDirectoryProvider: ImageDirectoryProviding {

    private let environment: [String: String]
    private let suffixes: NSOrderedSet

    init(environment: [String: String] = ProcessInfo.processInfo.environment, suffixes: NSOrderedSet = FBSnapshotTestCaseDefaultSuffixes()) {
        self.environment = environment
        self.suffixes = suffixes
    }

    var recordDirectory: String {
        return [referenceDirectory, suffixes.firstObject].flatMap { $0 as? String }.joined()
    }

    var verifyDirectories: [String] {
        let directories = suffixes.flatMap { $0 as? String }.map { referenceDirectory + $0 }

        return directories.isEmpty ? [referenceDirectory] : directories
    }

    // MARK: - Private

    private var referenceDirectory: String {
        return environment["FB_REFERENCE_IMAGE_DIR"] ?? "ReferenceImages"
    }

}
