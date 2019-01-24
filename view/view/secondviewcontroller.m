//
//  secondviewcontroller.m
//  view
//
//  Created by mx1614 on 1/17/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "secondviewcontroller.h"

@interface secondviewcontroller ()

@end

@implementation secondviewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSButton *button = [NSButton buttonWithTitle:@"hello" target:self action:@selector(hello)];
    
    [self.view addSubview:button];
    // Do view setup here.
}

- (void)hello
{
    NSLog(@"hello ");
}

@end
