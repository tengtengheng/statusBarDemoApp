//
//  bbuton.m
//  Example
//
//  Created by mx1614 on 1/24/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "bbuton.h"

@implementation bbuton

- (void)drawRect:(NSRect)dirtyRect {
   
    [[NSColor blueColor] setFill];
    NSRectFill(dirtyRect);
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    [paraStyle setParagraphStyle:[NSParagraphStyle defaultParagraphStyle]];
    [paraStyle setAlignment:NSTextAlignmentCenter];
    //[paraStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    NSDictionary *attrButton = [NSDictionary dictionaryWithObjectsAndKeys:[NSFont fontWithName:@"Verdana" size:18], NSFontAttributeName, [NSColor colorWithCalibratedRed:255 green:255 blue:255 alpha:1], NSForegroundColorAttributeName, paraStyle, NSParagraphStyleAttributeName, nil];
    NSAttributedString * btnString = [[NSAttributedString alloc] initWithString:@"注册" attributes:attrButton];
    [btnString drawInRect:NSMakeRect(0, 5, dirtyRect.size.width, dirtyRect.size.height)];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 3.0f;
     [super drawRect:dirtyRect];
    // Drawing code here.
}

@end
