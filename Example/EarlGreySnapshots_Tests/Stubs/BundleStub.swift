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
