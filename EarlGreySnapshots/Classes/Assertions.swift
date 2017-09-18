import EarlGrey

public func grey_recordSnapshot(_ name: String? = nil) -> GREYAssertionBlock {
    return grey_snapshot(testCaseName: name, recordMode: true, deviceAgnostic: false)
}

public func grey_recordDeviceAgnosticSnapshot(_ name: String? = nil) -> GREYAssertionBlock {
    return grey_snapshot(testCaseName: name, recordMode: true, deviceAgnostic: true)
}

public func grey_verifySnapshot(_ name: String? = nil) -> GREYAssertionBlock {
    return grey_snapshot(testCaseName: name, recordMode: false, deviceAgnostic: false)
}

public func grey_verifyDeviceAgnosticSnapshot(_ name: String? = nil) -> GREYAssertionBlock {
    return grey_snapshot(testCaseName: name, recordMode: false, deviceAgnostic: true)
}
