//
//  oneview.m
//  view
//
//  Created by mx1614 on 1/17/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "oneview.h"

@implementation oneview

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    self.wantsLayer = YES;
    self.layer.backgroundColor = [NSColor cyanColor].CGColor;
    
    NSButton *button = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 50, 50)];
//    NSButton *button2 = [[NSButton buttonwi]]
    button.title = @"touch me";

}

@end
