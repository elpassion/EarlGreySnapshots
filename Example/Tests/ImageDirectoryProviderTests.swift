//
//  Created by Mateusz Szklarek on 17/09/2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

@testable import EarlGreySnapshots
import XCTest

class ImageDirectoryProviderTests: XCTestCase {

    var sut: ImageDirectoryProvider!

    override func tearDown() {
        super.tearDown()

        sut = nil
    }

    func testProviderShouldReturnCorrectRecordAndVerifyDirectories() {
        let environment = ["FB_REFERENCE_IMAGE_DIR": "/reference/directory"]
        let suffixes = NSOrderedSet(array: ["_64", "_32"])
        sut = ImageDirectoryProvider(environment: environment, suffixes: suffixes)

        XCTAssertEqual(sut.directory, "/reference/directory_64")
    }

    func testProviderShouldReturnCorrectRecordAndVerifyDirectoriesForEmptyEnvironmentAndSuffixes() {
        sut = ImageDirectoryProvider(environment: [:], suffixes: NSOrderedSet(array: []))

        XCTAssertEqual(sut.directory, "ReferenceImages")
    }

    func testProviderShouldReturnCorrectRecordAndVerifyDirectoriesForDefaultParameters() {
        sut = ImageDirectoryProvider()

        XCTAssertEqual(sut.directory, "ReferenceImages_64")
    }

}

