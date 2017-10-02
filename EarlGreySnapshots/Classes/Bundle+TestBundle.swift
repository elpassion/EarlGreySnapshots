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
