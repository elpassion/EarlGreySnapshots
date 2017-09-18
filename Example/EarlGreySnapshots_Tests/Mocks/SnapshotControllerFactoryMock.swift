@testable import EarlGreySnapshots

class SnapshotControllerFactoryMock: SnapshotControllerCreating {

    var controllerMock = SnapshotControllerMock()

    private(set) var info: SnapshotControllerInfo?

    func makeSnapshotController(withInfo info: SnapshotControllerInfo) -> SnapshotTestController {
        self.info = info

        return controllerMock
    }

}
