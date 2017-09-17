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

        XCTAssertEqual(sut.recordDirectory, "/reference/directory_64")
        XCTAssertEqual(sut.verifyDirectories, ["/reference/directory_64", "/reference/directory_32"])
    }

    func testProviderShouldReturnCorrectRecordAndVerifyDirectoriesForEmptyEnvironmentAndSuffixes() {
        sut = ImageDirectoryProvider(environment: [:], suffixes: NSOrderedSet(array: []))

        XCTAssertEqual(sut.recordDirectory, "ReferenceImages")
        XCTAssertEqual(sut.verifyDirectories, ["ReferenceImages"])
    }

    func testProviderShouldReturnCorrectRecordAndVerifyDirectoriesForDefaultParameters() {
        sut = ImageDirectoryProvider()

        XCTAssertEqual(sut.recordDirectory, "ReferenceImages_64")
        XCTAssertEqual(sut.verifyDirectories, ["ReferenceImages_64", "ReferenceImages_32"])
    }

}

