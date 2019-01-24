//
//  ScaryBugData.m
//  ludytest
//
//  Created by mx1614 on 1/18/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData

- (instancetype) initwithTitle:(NSString *)title rating:(float)rating
{
    if (self == [super init]) {
        self.title = title;
        self.rating = rating;
    }
    return self;
}

@end
