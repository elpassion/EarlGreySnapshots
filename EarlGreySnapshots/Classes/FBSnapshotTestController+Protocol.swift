import FBSnapshotTestCase

protocol SnapshotTestController: class {
    var agnostic: Bool { get }
    var recording: Bool { get }
    var usesDrawInRect: Bool { get }
    var referenceDirectory: String { get }

    func compare(viewOrLayer: Any, selector: String, identifier: String?, tolerance: CGFloat) throws
}

extension FBSnapshotTestController: SnapshotTestController {

    var agnostic: Bool { return isDeviceAgnostic }
    var recording: Bool { return recordMode }
    var usesDrawInRect: Bool { return usesDrawViewHierarchyInRect }
    var referenceDirectory: String { return referenceImagesDirectory }

    func compare(viewOrLayer: Any, selector: String, identifier: String?, tolerance: CGFloat) throws {
        try compareSnapshot(ofViewOrLayer: viewOrLayer,
                            selector: Selector(selector),
                            identifier: identifier,
                            tolerance: tolerance)
    }

}
