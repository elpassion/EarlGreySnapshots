import Foundation

protocol BundleNameProviding {
    var name: String? { get }
}

struct BundleNameProvider: BundleNameProviding {

    init(bundle: Bundle) {
        self.bundle = bundle
    }

    // MARK: - BundleNameProviding

    var name: String? {
        return bundle.infoDictionary?["CFBundleName"] as? String
    }

    // MARK: - Private

    private let bundle: Bundle

}
