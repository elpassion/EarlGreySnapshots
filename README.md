# EarlGreySnapshots

[![CI Status](http://img.shields.io/travis/elpassion/EarlGreySnapshots.svg?style=flat)](https://travis-ci.org/turekj/EarlGreySnapshots)
[![Version](https://img.shields.io/cocoapods/v/EarlGreySnapshots.svg?style=flat)](http://cocoapods.org/pods/EarlGreySnapshots)
[![License](https://img.shields.io/cocoapods/l/EarlGreySnapshots.svg?style=flat)](http://cocoapods.org/pods/EarlGreySnapshots)
[![Platform](https://img.shields.io/cocoapods/p/EarlGreySnapshots.svg?style=flat)](http://cocoapods.org/pods/EarlGreySnapshots)

[EarlGrey](https://github.com/google/EarlGrey) actions for [FBSnapshotTestCase](https://github.com/facebook/ios-snapshot-test-case). Provides functional tests counterpart for [Nimble Snapshots](https://github.com/ashfurrow/Nimble-Snapshots).

## Usage

Before using the library you need to have a project integrated with EarlGrey library. It is highly recommended to follow an [official installation guide](https://github.com/google/EarlGrey/blob/master/docs/install-and-run.md) and create a separate test target for feature testing, since they are less reliable than usual unit tests.

Next, make sure to define two environment variables which point to:

* `FB_REFERENCE_IMAGE_DIR` - directory containing reference snapshots,
* `IMAGE_DIFF_DIR` - directory containing failure snapshots and visual diffs.

Sane default values for those variables are (as proposed in [FBSnapshotTestCase](https://github.com/facebook/ios-snapshot-test-case) README):

|Name|Value|
|:---|:----|
|`FB_REFERENCE_IMAGE_DIR`|`$(SOURCE_ROOT)/$(PROJECT_NAME)Tests/ReferenceImages`|
|`IMAGE_DIFF_DIR`|`$(SOURCE_ROOT)/$(PROJECT_NAME)Tests/FailureDiffs`|

![](https://github.com/facebook/ios-snapshot-test-case/blob/master/FBSnapshotTestCaseDemo/Scheme_FB_REFERENCE_IMAGE_DIR.png)

Now it is time to record your first reference snapshot. Select the reference element using EarlGrey's selection API and invoke `grey_recordSnapshot()` action:

```swift
EarlGrey.select(elementWithMatcher: grey_kindOfClass(AViewToSnapshotClass.self))
    .assert(grey_recordSnapshot())
```

Run the test target. The test should fail with the following error:

```
Image recorded successfully! Replace with grey_verifySnapshot().
```

Having followed the instruction you should alter the test as following:

```swift
EarlGrey.select(elementWithMatcher: grey_kindOfClass(AViewToSnapshotClass.self))
    .assert(grey_verifySnapshot())
```

That's it! From now on the tests will verify whether selected view matches reference snapshot.

### Device agnostic snapshots

Using `grey_recordSnapshot()` and `grey_verifySnapshot()` will not work when executing the tests against devices with differing resoultions and pixel densities. To enable such tests you should use `grey_recordDeviceAgnosticSnapshot()` and `grey_verifyDeviceAgnosticSnapshot()` APIs instead. They compare the snapshots paired by the test name and also device type, which means you have to separately record snapshots for all the supported device types.

## Requirements

EarlGreySnapshots glues together two libraries:

* [EarlGrey](https://github.com/google/EarlGrey),
* [FBSnapshotTestCase](https://github.com/facebook/ios-snapshot-test-case).

Make sure to install them both alongside the project.

## Installation

EarlGreySnapshots is available through [CocoaPods](http://cocoapods.org). To install
it, simply add following lines to your Podfile:

```ruby
pod 'EarlGrey', '~> 1.12'
pod 'FBSnapshotTestCase', '~> 2.1'
pod 'EarlGreySnapshots', '~> 0.0.4'
```

Don't forget to run `pod install` afterwards!

## Example project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Credits

The project derives heavily from ideas found in [Nimble Snapshots](https://github.com/ashfurrow/Nimble-Snapshots). Huge credits go to [@ashfurrow](https://twitter.com/ashfurrow) and other maintainers.

## Author

turekj, jakub.turek@elpassion.pl

## License

EarlGreySnapshots is available under the MIT license. See the LICENSE file for more info.
