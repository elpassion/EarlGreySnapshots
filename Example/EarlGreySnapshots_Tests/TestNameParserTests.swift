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

    func testParseCorrectlyParsesTargetPrefixedTestCaseInfo() {
        let name = "-[EarlGreySnapshots_Tests.EarlGreySnapshotErrorTests testMethodName]"

        let result = sut.parse(testName: name)

        XCTAssertEqual("EarlGreySnapshots_Tests_EarlGreySnapshotErrorTests", result.testClassName)
        XCTAssertEqual("testMethodName", result.testMethodName)
    }
    
}
