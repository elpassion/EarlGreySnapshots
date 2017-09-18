@testable import EarlGreySnapshots
import XCTest

class SnapshotControllerFactoryTests: XCTestCase {

    var sut: SnapshotControllerFactory!

    override func setUp() {
        super.setUp()

        sut = SnapshotControllerFactory()
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
    }

    func testControllerHasCorrectUsesDrawViewHierarchyInRectSettingSet() {
        let info = SnapshotControllerInfo.testInfo(testName: "TestName", deviceAgnostic: false, recordMode: false)

        let controller = sut.makeSnapshotController(withInfo: info)

        XCTAssertFalse(controller.usesDrawInRect)
    }

    func testControllerHasCorrectDeviceAgnosticSettingSet() {
        let firstInfo = SnapshotControllerInfo.testInfo(deviceAgnostic: false, recordMode: false)
        let secondInfo = SnapshotControllerInfo.testInfo(deviceAgnostic: true, recordMode: false)

        let firstController = sut.makeSnapshotController(withInfo: firstInfo)
        let secondController = sut.makeSnapshotController(withInfo: secondInfo)

        XCTAssertFalse(firstController.agnostic)
        XCTAssertTrue(secondController.agnostic)
    }

    func testControllerHasCorrectRecordModeSet() {
        let firstInfo = SnapshotControllerInfo.testInfo(deviceAgnostic: false, recordMode: false)
        let secondInfo = SnapshotControllerInfo.testInfo(deviceAgnostic: false, recordMode: true)

        let firstController = sut.makeSnapshotController(withInfo: firstInfo)
        let secondController = sut.makeSnapshotController(withInfo: secondInfo)

        XCTAssertFalse(firstController.recording)
        XCTAssertTrue(secondController.recording)
    }

    func testControllerHasCorrectReferenceImagesDirectorySet() {
        let info = SnapshotControllerInfo.testInfo(deviceAgnostic: false,
                                                   recordMode: false,
                                                   imagesDirectory: "/reference/directory")

        let controller = sut.makeSnapshotController(withInfo: info)

        XCTAssertEqual("/reference/directory", controller.referenceDirectory)
    }

}
