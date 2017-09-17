//
//  Created by Mateusz Szklarek on 17/09/2017.
//  Copyright © 2017 EL Passion. All rights reserved.
//

@testable import EarlGreySnapshots
import Foundation

class ImageDirectoryProviderStub: ImageDirectoryProviding {

    let recordDirectory: String = "RecordedDirectory_64"
    let verifyDirectories: [String] = ["VerifiedDirectory_64", "VerifiedDirectory_32"]

}
