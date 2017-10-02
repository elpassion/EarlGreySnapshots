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

    // TODO: Method 'initialize()' defines Objective-C class method 'initialize', which is not permitted by Swift
    override open class func initialize() {
        super.initialize()
        XCTestObservationCenter.shared.addTestObserver(CurrentTestObserver.shared)
    }

}
