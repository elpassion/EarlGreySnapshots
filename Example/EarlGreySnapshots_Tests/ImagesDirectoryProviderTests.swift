@testable import EarlGreySnapshots
import XCTest

class ImagesDirectoryProviderTests: XCTestCase {

    var sut: ImagesDirectoryProvider!

    override func tearDown() {
        super.tearDown()

        sut = nil
    }

    func testProviderShouldReturnCorrectRecordAndVerifyDirectories() {
        let environment = ["FB_REFERENCE_IMAGE_DIR": "/reference/directory"]
        let suffixes = NSOrderedSet(array: ["_64", "_32"])
        sut = ImagesDirectoryProvider(environment: environment, suffixes: suffixes)

        XCTAssertEqual(sut.directory, "/reference/directory_64")
    }

    func testProviderShouldReturnCorrectRecordAndVerifyDirectoriesForEmptyEnvironmentAndSuffixes() {
        sut = ImagesDirectoryProvider(environment: [:], suffixes: NSOrderedSet(array: []))

        XCTAssertEqual(sut.directory, "ReferenceImages")
    }

    func testProviderShouldReturnCorrectRecordAndVerifyDirectoriesForDefaultParameters() {
        sut = ImagesDirectoryProvider()

        XCTAssertEqual(sut.directory, "ReferenceImages_64")
    }

}

