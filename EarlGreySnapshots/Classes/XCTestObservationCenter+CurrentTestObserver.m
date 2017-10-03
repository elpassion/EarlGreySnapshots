#import "XCTestObservationCenter+CurrentTestObserver.h"
#import "EarlGreySnapshots/EarlGreySnapshots-Swift.h"

@implementation XCTestObservationCenter (CurrentTestObserver)

+ (void)load {
    [super load];

    [self.sharedTestObservationCenter addTestObserver:CurrentTestObserver.shared];
}

@end
