//
//  Created by Mateusz Szklarek on 16/09/2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

@testable import EarlGreySnapshots
import XCTest

class BundleNameProviderTests: XCTestCase {

    var sut: BundleNameProvider!
    var bundleStub: BundleStub!

    override func setUp() {
        super.setUp()

        bundleStub = BundleStub()
        sut = BundleNameProvider(bundle: bundleStub)
    }

    override func tearDown() {
        super.tearDown()

        bundleStub = nil
        sut = nil
    }

    func testProviderShouldReturnCorrectBundleName() {
        bundleStub.bundleName = "SomeFancyApp"

        XCTAssertEqual(sut.name, "SomeFancyApp")
    }

    func testProviderShouldReturnEmptyBundleName() {
        bundleStub.bundleName = nil

        XCTAssertEqual(sut.name, "")
    }

}
