//
//  Created by Jakub Turek on 19.05.2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

@testable import EarlGreySnapshots
import XCTest

class SnapshotControllerFactoryTests: XCTestCase {

    var sut: SnapshotControllerFactory!
    var info: SnapshotControllerInfo!

    override func setUp() {
        super.setUp()

        sut = SnapshotControllerFactory()
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
        info = nil
    }

    func testControllerHasCorrectUsesDrawViewHierarchyInRectSettingSet() {
        info = SnapshotControllerInfo(testName: "TestName",
                                      deviceAgnostic: false,
                                      recordMode: false,
                                      imagesDirectory: "")

        let controller = sut.makeSnapshotController(withInfo: info)

        XCTAssertFalse(controller.usesDrawInRect)
    }

    func testControllerHasCorrectDeviceAgnosticSettingSet() {
        info = SnapshotControllerInfo(testName: "", deviceAgnostic: false, recordMode: false, imagesDirectory: "")
        let firstController = sut.makeSnapshotController(withInfo: info)
        info = SnapshotControllerInfo(testName: "", deviceAgnostic: true, recordMode: false, imagesDirectory: "")
        let secondController = sut.makeSnapshotController(withInfo: info)

        XCTAssertFalse(firstController.agnostic)
        XCTAssertTrue(secondController.agnostic)
    }

    func testControllerHasCorrectRecordModeSet() {
        info = SnapshotControllerInfo(testName: "", deviceAgnostic: false, recordMode: false, imagesDirectory: "")
        let firstController = sut.makeSnapshotController(withInfo: info)
        info = SnapshotControllerInfo(testName: "", deviceAgnostic: false, recordMode: true, imagesDirectory: "")
        let secondController = sut.makeSnapshotController(withInfo: info)

        XCTAssertFalse(firstController.recording)
        XCTAssertTrue(secondController.recording)
    }

    func testControllerHasCorrectimagesDirectorySettingSet() {
        info = SnapshotControllerInfo(testName: "", deviceAgnostic: false, recordMode: false, imagesDirectory: "/reference/directory")

        let controller = sut.makeSnapshotController(withInfo: info)

        XCTAssertEqual("/reference/directory", controller.referenceDirectory)
    }
    
}
