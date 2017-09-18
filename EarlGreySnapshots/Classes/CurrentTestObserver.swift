import XCTest

class CurrentTestObserver: NSObject, XCTestObservation {

    static let shared: CurrentTestObserver = CurrentTestObserver()

    var currentCase: XCTestCase?

    func testCaseWillStart(_ testCase: XCTestCase) {
        CurrentTestObserver.shared.currentCase = testCase
    }

    func testCaseDidFinish(_ testCase: XCTestCase) {
        CurrentTestObserver.shared.currentCase = nil
    }

}

extension XCTestObservationCenter {

    override open class func initialize() {
        super.initialize()
        XCTestObservationCenter.shared().addTestObserver(CurrentTestObserver.shared)
    }

}
