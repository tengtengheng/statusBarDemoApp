//
//  ScaryBugData.h
//  ludytest
//
//  Created by mx1614 on 1/18/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScaryBugData : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) float rating;

- (instancetype)initwithTitle:(NSString *)title rating:(float)rating;

@end

NS_ASSUME_NONNULL_END
