//
//  Created by Jakub Turek on 19.05.2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

@testable import EarlGreySnapshots
import XCTest

class TestNameParserTests: XCTestCase {

    var sut: TestNameParser!

    override func setUp() {
        super.setUp()
        sut = TestNameParser()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testParseCorrectlyParsesTestCaseInfo() {
        let name = "-[TestNameParserTests testParseCorrectlyParsesTestCaseInfo]"

        let result = sut.parse(testName: name)

        XCTAssertEqual("TestNameParserTests", result.testClassName)
        XCTAssertEqual("testParseCorrectlyParsesTestCaseInfo", result.testMethodName)
    }
    
}
