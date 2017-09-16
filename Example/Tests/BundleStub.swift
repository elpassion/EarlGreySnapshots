//
//  Created by Mateusz Szklarek on 16/09/2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

import Foundation
import XCTest

class BundleStub: Bundle {

    var bundleName: String?

    override var infoDictionary: [String : Any]? {
        var dict: [String: Any] = [:]
        dict["CFBundleName"] = bundleName
        return dict
    }

}
