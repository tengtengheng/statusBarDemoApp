//
//  ScaryBugDoc.m
//  ludytest
//
//  Created by mx1614 on 1/18/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "ScaryBugDoc.h"
#import "ScaryBugData.h"

@implementation ScaryBugDoc

- (instancetype)initWithTitle:(NSString *)title rating:(float)rating thumbImage:(NSImage *)thumimage fullImage:(NSImage *)fullimage
{
    if (self == [super init]) {
        self.data = [[ScaryBugData alloc] initwithTitle:title rating:rating];
        self.thumbImage = thumimage;
        self.fullImage = fullimage;
    }
    return self;
}
@end
