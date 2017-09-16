//
//  Created by Mateusz Szklarek on 16/09/2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

import Foundation

protocol BundleNameProviding {
    var name: String { get }
}

struct BundleNameProvider: BundleNameProviding {

    init(bundle: Bundle) {
        self.bundle = bundle
    }

    // MARK: - BundleNameProviding

    var name: String {
        return ""
    }

    // MARK: - Private

    private let bundle: Bundle

}
