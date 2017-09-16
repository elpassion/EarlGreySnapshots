//
//  Created by Mateusz Szklarek on 16/09/2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

@testable import EarlGreySnapshots
import XCTest

class Bundle_TestBundleTests: XCTestCase {

    var sut: Bundle!

    override func setUp() {
        super.setUp()

        sut = Bundle.testBundle
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
    }

    func testShouldReturnCorrectTestBundleName() {
        let testBundleName = sut.infoDictionary!["CFBundleName"] as! String

        XCTAssertEqual(testBundleName, "EarlGreySnapshots_Tests")
    }

}

