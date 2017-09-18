@testable import EarlGreySnapshots
import XCTest

class SnapshotActionTests: XCTestCase {

    var controller: SnapshotControllerMock!
    var factory: SnapshotControllerFactoryMock!
    var directoryProviderStub: ImagesDirectoryProviding!
    var view: UIView!

    override func setUp() {
        super.setUp()
        controller = SnapshotControllerMock()
        factory = SnapshotControllerFactoryMock()
        factory.controllerMock = controller
        directoryProviderStub = ImagesDirectoryProviderStub()
        view = UIView()
    }

    override func tearDown() {
        super.tearDown()
        controller = nil
        factory = nil
        view = nil
    }

    func testAssertionShouldHaveCorrectName() {
        let assertion = grey_snapshot(testName: "", snapshotName: "", recordMode: true, deviceAgnostic: true)

        XCTAssertEqual("snapshot", assertion.name())
    }

    func testAssertionShouldInvokeControllerFactoryWithCorrectArguments() {
        let assertion = grey_snapshot(testName: "The Test Name", snapshotName: "The Snapshot Name", recordMode: false,
                                      deviceAgnostic: true, controllerFactory: factory,
                                      imagesDirectoryProvider: directoryProviderStub)
        var error: NSError?

        assertion.assert(view, error: &error)

        XCTAssertFalse(factory.info!.recordMode)
        XCTAssertTrue(factory.info!.deviceAgnostic)
        XCTAssertEqual("The Test Name", factory.info?.testName)
        XCTAssertEqual("FakeDirectory_64", factory.info?.imagesDirectory)
    }

    func testAssertionShouldInvokeControllersCompareWithCorrectArguments() {
        let assertion = grey_snapshot(testName: "TN", snapshotName: "SN", recordMode: false, deviceAgnostic: false,
                                      controllerFactory: factory, imagesDirectoryProvider: directoryProviderStub)
        var error: NSError?

        assertion.assert(view, error: &error)

        XCTAssertEqual(view, controller.viewOrLayer as? UIView)
        XCTAssertEqual("SN", controller.selector!)
        XCTAssertNil(controller.identifier)
        XCTAssertEqual(0.0, controller.tolerance!)
        XCTAssertEqual("FakeDirectory_64", factory.info?.imagesDirectory)
    }

    func testAssertionShouldReturnTrueIfNoErrorIsRaised() {
        let assertion = grey_snapshot(testName: "TN", snapshotName: "SN", recordMode: false, deviceAgnostic: false,
                                      controllerFactory: factory, imagesDirectoryProvider: directoryProviderStub)
        var error: NSError?

        let success = assertion.assert(view, error: &error)

        XCTAssertNil(error)
        XCTAssertTrue(success)
    }

    func testAssertionShouldReturnComparisonError() {
        let comparisonError = NSError(domain: "ComparisonError", code: 1, userInfo: ["Hey": "Hi"])
        controller.error = comparisonError
        let assertion = grey_snapshot(testName: "TN", snapshotName: "SN", recordMode: false, deviceAgnostic: false,
                                      controllerFactory: factory, imagesDirectoryProvider: directoryProviderStub)
        var error: NSError?

        let success = assertion.assert(view, error: &error)

        XCTAssertEqual(error, comparisonError)
        XCTAssertFalse(success)
    }

    func testAssertionShouldAlwaysReturnErrorInRecordMode() {
        let assertion = grey_snapshot(testName: "TN", snapshotName: "SN", recordMode: true,
                                      deviceAgnostic: false, controllerFactory: factory,
                                      imagesDirectoryProvider: directoryProviderStub)
        var error: NSError?

        let success = assertion.assert(view, error: &error)

        XCTAssertEqual(error, EarlGreySnapshotError.recording(deviceAgnostic: false) as NSError)
        XCTAssertFalse(success)
        XCTAssertEqual("FakeDirectory_64", factory.info?.imagesDirectory)
    }

    func testActionShouldAlwaysPassDeviceAgnosticToErrorInRecordMode() {
        let assertion = grey_snapshot(testName: "TN", snapshotName: "SN", recordMode: true,
                                      deviceAgnostic: true, controllerFactory: factory)
        var error: NSError?

        assertion.assert(view, error: &error)

        XCTAssertEqual(error, EarlGreySnapshotError.recording(deviceAgnostic: true) as NSError)
    }

}
