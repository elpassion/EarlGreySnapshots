//
//  Created by Jakub Turek on 19.05.2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

@testable import EarlGreySnapshots

class SnapshotControllerMock: SnapshotTestController {

    var agnostic: Bool = false
    var recording: Bool = false
    var usesDrawInRect: Bool = false
    var referenceDirectory: String = "/reference_directory"

    var error: Error?

    var viewOrLayer: Any?
    var selector: String?
    var identifier: String?
    var tolerance: CGFloat?

    func compare(viewOrLayer: Any, selector: String, identifier: String?, tolerance: CGFloat) throws {
        self.viewOrLayer = viewOrLayer
        self.selector = selector
        self.identifier = identifier
        self.tolerance = tolerance

        if let error = error {
            throw error
        }
    }

}
