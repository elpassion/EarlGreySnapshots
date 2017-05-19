//
//  Created by Jakub Turek on 19.05.2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

import FBSnapshotTestCase

protocol SnapshotControllerCreating {

    func makeSnapshotController(testName: String, deviceAgnostic: Bool, recordMode: Bool) -> SnapshotTestController

}

class SnapshotControllerFactory: SnapshotControllerCreating {

    private let environment: [String: String]

    init(environment: [String: String]) {
        self.environment = environment
    }

    func makeSnapshotController(testName: String, deviceAgnostic: Bool, recordMode: Bool) -> SnapshotTestController {
        let testController: FBSnapshotTestController = FBSnapshotTestController(testName: testName)
        testController.isDeviceAgnostic = deviceAgnostic
        testController.recordMode = recordMode
        testController.usesDrawViewHierarchyInRect = false
        testController.referenceImagesDirectory = environment["FB_REFERENCE_IMAGE_DIR"]

        return testController
    }

}
