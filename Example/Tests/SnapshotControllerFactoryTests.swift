//
//  Created by Jakub Turek on 19.05.2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

@testable import EarlGreySnapshots
import XCTest

class SnapshotControllerFactoryTests: XCTestCase {

    var environment: [String: String]!
    var sut: SnapshotControllerFactory!

    override func setUp() {
        super.setUp()
        environment = ["FB_REFERENCE_IMAGE_DIR": "/reference/directory"]
        sut = SnapshotControllerFactory(environment: environment)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        environment = nil
    }

    func testControllerHasCorrectUsesDrawViewHierarchyInRectSettingSet() {
        let controller = sut.makeSnapshotController(testName: "TestName", deviceAgnostic: false, recordMode: false)

        XCTAssertFalse(controller.usesDrawInRect)
    }

    func testControllerHasCorrectDeviceAgnosticSettingSet() {
        let firstController = sut.makeSnapshotController(testName: "", deviceAgnostic: false, recordMode: false)
        let secondController = sut.makeSnapshotController(testName: "", deviceAgnostic: true, recordMode: false)

        XCTAssertFalse(firstController.agnostic)
        XCTAssertTrue(secondController.agnostic)
    }

    func testControllerHasCorrectRecordModeSet() {
        let firstController = sut.makeSnapshotController(testName: "", deviceAgnostic: false, recordMode: false)
        let secondController = sut.makeSnapshotController(testName: "", deviceAgnostic: false, recordMode: true)

        XCTAssertFalse(firstController.recording)
        XCTAssertTrue(secondController.recording)
    }

    func testControllerHasCorrectReferenceDirectorySettingSet() {
        let controller = sut.makeSnapshotController(testName: "", deviceAgnostic: false, recordMode: false)

        XCTAssertEqual("/reference/directory", controller.referenceDirectory)
    }
    
}
