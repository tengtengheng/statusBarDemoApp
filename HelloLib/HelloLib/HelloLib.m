//
//  HelloLib.m
//  HelloLib
//
//  Created by mx1614 on 1/23/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "HelloLib.h"
#import "AppKit/AppKit.h"
#import "Aspects.h"


@implementation HelloLib

+ (void)load
{
    NSLog(@"==========HelloLib already load===========");
    
    id viewController = NSClassFromString(@"ViewController");
    [viewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>info)
     {
         id instance = info.instance;
         NSTextField *targetLabel = [instance valueForKeyPath:@"titleLabel"];
         targetLabel.stringValue = @"Text Already changed from HelloLib";
     }error:nil];
    
}

@end
