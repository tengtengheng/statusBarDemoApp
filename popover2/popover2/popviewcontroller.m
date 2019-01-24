//
//  popviewcontroller.m
//  popover2
//
//  Created by mx1614 on 1/22/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "popviewcontroller.h"

@interface popviewcontroller ()

@end

@implementation popviewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)btn_click:(id)sender {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    NSString *name = _text_name.stringValue;
    [nc postNotificationName:@"click" object:self userInfo:@{@"name":name}];
}


@end
