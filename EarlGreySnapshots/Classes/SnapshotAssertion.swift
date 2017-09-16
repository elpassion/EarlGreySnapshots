//
//  Created by Jakub Turek on 19.05.2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

import EarlGrey

func grey_snapshot(testCaseName: String?, recordMode: Bool, deviceAgnostic: Bool) -> GREYAssertionBlock {
    let testCase = testCaseName ?? CurrentTestObserver.shared.currentCase?.name ?? "-[UnknownTestCase unknownMethod]"
    let testInfo = TestNameParser().parse(testName: testCase)
    let bundleNameProvider = BundleNameProvider(bundle: Bundle.testBundle)
    let testName = [bundleNameProvider.name, testInfo.testClassName].flatMap { $0 }.joined(separator: ".")

    return grey_snapshot(testName: testName,
                         snapshotName: testInfo.testMethodName,
                         recordMode: recordMode,
                         deviceAgnostic: deviceAgnostic)
}

func grey_snapshot(testName: String, snapshotName: String, recordMode: Bool, deviceAgnostic: Bool,
                   controllerFactory: SnapshotControllerCreating? = nil) -> GREYAssertionBlock {
    return GREYAssertionBlock.init(name: "snapshot", assertionBlockWithError: { element, errorOrNil -> Bool in
        guard let view = element as? UIView else { return false }

        let factory = controllerFactory ?? SnapshotControllerFactory(environment: ProcessInfo.processInfo.environment)
        let testController = factory.makeSnapshotController(testName: testName,
                                                            deviceAgnostic: deviceAgnostic,
                                                            recordMode: recordMode)

        do {
            try testController.compare(viewOrLayer: view, selector: snapshotName, identifier: nil, tolerance: 0.0)
        } catch let error as NSError {
            errorOrNil?.pointee = error
        }

        if errorOrNil?.pointee == nil && recordMode {
            errorOrNil?.pointee = EarlGreySnapshotError.recording(deviceAgnostic: deviceAgnostic) as NSError
        }

        return errorOrNil?.pointee == nil
    })
}
