import XCTest

public final class CurrentTestObserver: NSObject, XCTestObservation {

    @objc public static let shared: CurrentTestObserver = CurrentTestObserver()

    private(set) var currentCase: XCTestCase?

    public func testCaseWillStart(_ testCase: XCTestCase) {
        CurrentTestObserver.shared.currentCase = testCase
    }

    public func testCaseDidFinish(_ testCase: XCTestCase) {
        CurrentTestObserver.shared.currentCase = nil
    }

}
