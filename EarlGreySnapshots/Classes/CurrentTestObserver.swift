//
//  Created by Jakub Turek on 19.05.2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

import XCTest

class CurrentTestObserver: NSObject, XCTestObservation {

    static let shared = CurrentTestObserver()
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
