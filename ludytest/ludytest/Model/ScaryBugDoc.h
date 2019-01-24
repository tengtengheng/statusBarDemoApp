//
//  ScaryBugDoc.h
//  ludytest
//
//  Created by mx1614 on 1/18/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ScaryBugData;

NS_ASSUME_NONNULL_BEGIN

@interface ScaryBugDoc : NSObject

@property (nonatomic, strong) ScaryBugData *data;
@property (nonatomic, strong) NSImage *thumbImage;
@property (nonatomic, strong) NSImage *fullImage;

- (instancetype)initWithTitle:(NSString *)title rating:(float)rating
                   thumbImage:(NSImage *)thumimage fullImage:(NSImage *)fullimage;

@end

NS_ASSUME_NONNULL_END
