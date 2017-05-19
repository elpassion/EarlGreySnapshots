//
//  Created by Jakub Turek on 19.05.2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

@testable import EarlGreySnapshots
import XCTest

class EarlGreySnapshotErrorTests: XCTestCase {

    func testErrorRendersCorrectFailureReasonForNonDeviceAgnostic() {
        let error = EarlGreySnapshotError.recording(deviceAgnostic: false)

        let failureReason = error.errorUserInfo[NSLocalizedFailureReasonErrorKey] as! String

        XCTAssertEqual("Image recorded successfully! Replace with grey_verifySnapshot().", failureReason)
    }

    func testErrorRendersCorrectFailureReasonForDeviceAgnostic() {
        let error = EarlGreySnapshotError.recording(deviceAgnostic: true)

        let failureReason = error.errorUserInfo[NSLocalizedFailureReasonErrorKey] as! String

        XCTAssertEqual("Image recorded successfully! Replace with grey_verifyDeviceAgnosticSnapshot().", failureReason)
    }
    
}
