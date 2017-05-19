//
//  Created by Jakub Turek on 19.05.2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

@testable import EarlGreySnapshots

class SnapshotControllerFactoryMock: SnapshotControllerCreating {

    var controllerMock = SnapshotControllerMock()

    var testName: String?
    var deviceAgnostic: Bool?
    var recordMode: Bool?

    func makeSnapshotController(testName: String, deviceAgnostic: Bool, recordMode: Bool) -> SnapshotTestController {
        self.testName = testName
        self.deviceAgnostic = deviceAgnostic
        self.recordMode = recordMode

        return controllerMock
    }

}
