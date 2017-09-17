//
//  Created by Jakub Turek on 19.05.2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

@testable import EarlGreySnapshots

class SnapshotControllerFactoryMock: SnapshotControllerCreating {

    var controllerMock = SnapshotControllerMock()

    private(set) var info: SnapshotControllerInfo?

    func makeSnapshotController(withInfo info: SnapshotControllerInfo) -> SnapshotTestController {
        self.info = info

        return controllerMock
    }

}
