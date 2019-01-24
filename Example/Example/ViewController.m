//
//  ViewController.m
//  Example
//
//  Created by mx1614 on 1/23/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "ViewController.h"
#import "bbuton.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSView *view = [[NSView alloc]init];
    view.frame = NSMakeRect(200, 200, 100, 100);
    view.wantsLayer = YES;
    view.layer.backgroundColor = [NSColor redColor].CGColor;
    [self.view addSubview:view];
   
    bbuton *bt = [[bbuton alloc] init];
    NSRect rect = NSMakeRect(0, 0, 10, 20);
    [bt drawRect:rect];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)click:(id)sender {
    self.titleLabel.stringValue = @"clicked the button";
    
}


    



@end
