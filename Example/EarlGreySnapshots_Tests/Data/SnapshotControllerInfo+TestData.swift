@testable import EarlGreySnapshots

extension SnapshotControllerInfo {

    static func testInfo(testName: String = "",
                         deviceAgnostic: Bool,
                         recordMode: Bool,
                         imagesDirectory: String = "") -> SnapshotControllerInfo {
        return SnapshotControllerInfo(testName: testName,
                                      deviceAgnostic: deviceAgnostic,
                                      recordMode: recordMode,
                                      imagesDirectory: imagesDirectory)
    }

}
