//
//  MasterViewController.h
//  ludytest
//
//  Created by mx1614 on 1/17/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface MasterViewController : NSViewController

@property (nonatomic, strong) NSMutableArray *bugs;

@property (weak) IBOutlet NSTextField *worldcounter;

@end

NS_ASSUME_NONNULL_END
