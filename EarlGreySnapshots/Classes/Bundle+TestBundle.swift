//
//  Created by Mateusz Szklarek on 16/09/2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

import Foundation

extension Bundle {

    static var testBundle: Bundle {
        let optionalTestBundle = allBundles.first { $0.bundlePath.hasSuffix(".xctest") }
        guard let testBundle = optionalTestBundle else {
            fatalError("Can not find bundle with suffix .xctest")
        }
        return testBundle
    }

}
