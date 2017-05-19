//
//  Created by Jakub Turek on 19.05.2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

@testable import EarlGreySnapshots
import XCTest

class SnapshotActionTests: XCTestCase {

    var controller: SnapshotControllerMock!
    var factory: SnapshotControllerFactoryMock!
    var view: UIView!

    override func setUp() {
        super.setUp()
        controller = SnapshotControllerMock()
        factory = SnapshotControllerFactoryMock()
        factory.controllerMock = controller
        view = UIView()
    }

    override func tearDown() {
        super.tearDown()
        controller = nil
        factory = nil
        view = nil
    }

    func testActionShouldHaveCorrectName() {
        let action = grey_snapshot(testName: "", snapshotName: "", recordMode: true, deviceAgnostic: true)

        XCTAssertEqual("snapshot", action.name())
    }

    func testActionShouldInvokeControllerFactoryWithCorrectArguments() {
        let action = grey_snapshot(testName: "The Test Name", snapshotName: "The Snapshot Name", recordMode: false,
                                   deviceAgnostic: true, controllerFactory: factory)
        var error: NSError?

        action.perform(view, error: &error)

        XCTAssertFalse(factory.recordMode!)
        XCTAssertTrue(factory.deviceAgnostic!)
        XCTAssertEqual("The Test Name", factory.testName!)
    }

    func testActionShouldInvokeControllersCompareWithCorrectArguments() {
        let action = grey_snapshot(testName: "TN", snapshotName: "SN", recordMode: false, deviceAgnostic: false,
                                   controllerFactory: factory)
        var error: NSError?

        action.perform(view, error: &error)

        XCTAssertEqual(view, controller.viewOrLayer as? UIView)
        XCTAssertEqual("SN", controller.selector!)
        XCTAssertNil(controller.identifier)
        XCTAssertEqual(0.0, controller.tolerance!)
    }

    func testActionShouldReturnTrueIfNoErrorIsRaised() {
        let action = grey_snapshot(testName: "TN", snapshotName: "SN", recordMode: false, deviceAgnostic: false,
                                   controllerFactory: factory)
        var error: NSError?

        let success = action.perform(view, error: &error)

        XCTAssertNil(error)
        XCTAssertTrue(success)
    }

    func testActionShouldReturnComparisonError() {
        let comparisonError = NSError(domain: "ComparisonError", code: 1, userInfo: ["Hey": "Hi"])
        controller.error = comparisonError
        let action = grey_snapshot(testName: "TN", snapshotName: "SN", recordMode: false, deviceAgnostic: false,
                                   controllerFactory: factory)
        var error: NSError?

        let success = action.perform(view, error: &error)

        XCTAssertEqual(error, comparisonError)
        XCTAssertFalse(success)
    }

    func testActionShouldAlwaysReturnErrorInRecordMode() {
        let action = grey_snapshot(testName: "TN", snapshotName: "SN", recordMode: true,
                                   deviceAgnostic: false, controllerFactory: factory)
        var error: NSError?

        let success = action.perform(view, error: &error)

        XCTAssertEqual(error, EarlGreySnapshotError.recording(deviceAgnostic: false) as NSError)
        XCTAssertFalse(success)
    }

    func testActionShouldAlwaysPassDeviceAgnosticToErrorInRecordMode() {
        let action = grey_snapshot(testName: "TN", snapshotName: "SN", recordMode: true,
                                   deviceAgnostic: true, controllerFactory: factory)
        var error: NSError?

        action.perform(view, error: &error)

        XCTAssertEqual(error, EarlGreySnapshotError.recording(deviceAgnostic: true) as NSError)
    }
    
}
