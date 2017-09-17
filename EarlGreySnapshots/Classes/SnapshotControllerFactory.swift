//
//  Created by Jakub Turek on 19.05.2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

import FBSnapshotTestCase

protocol SnapshotControllerCreating {

    func makeSnapshotController(withInfo info: SnapshotControllerInfo) -> SnapshotTestController

}

class SnapshotControllerFactory: SnapshotControllerCreating {

    func makeSnapshotController(withInfo info: SnapshotControllerInfo) -> SnapshotTestController {
        let testController: FBSnapshotTestController = FBSnapshotTestController(testName: info.testName)
        testController.isDeviceAgnostic = info.deviceAgnostic
        testController.recordMode = info.recordMode
        testController.usesDrawViewHierarchyInRect = false
        testController.referenceImagesDirectory = info.imagesDirectory

        return testController
    }

}
