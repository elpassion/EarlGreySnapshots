#import "EarlGreySnapshots/EarlGreySnapshots-Swift.h"
#import "XCTestObservationCenter+CurrentTestObserver.h"

@implementation XCTestObservationCenter (CurrentTestObserver)

+ (void)load {
    [super load];

    [self.sharedTestObservationCenter addTestObserver:CurrentTestObserver.shared];
}

@end
