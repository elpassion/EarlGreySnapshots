//
//  Created by Jakub Turek on 19.05.2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

import Foundation

struct TestCaseInfo {

    let testClassName: String
    let testMethodName: String

}

class TestNameParser {

    func parse(testName: String) -> TestCaseInfo {
        guard let re = try? NSRegularExpression(pattern: "-\\[([\\w\\.]+)\\s+(\\w+)\\]", options: []) else {
            fatalError("Could not build regular expression for parsing test name")
        }

        guard let match = re.matches(in: testName,
                                     options: [],
                                     range: NSRange(location: 0, length: testName.utf16.count)).first else {
                                        fatalError("Could not find a match in test name while parsing")
        }

        let testClassName = (testName as NSString)
            .substring(with: match.rangeAt(1))
            .replacingOccurrences(of: ".", with: "_")

        let testMethodName = (testName as NSString)
            .substring(with: match.rangeAt(2))

        return TestCaseInfo(testClassName: testClassName, testMethodName: testMethodName)
    }
    
}
