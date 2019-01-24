//
//  ViewController.m
//  popover2
//
//  Created by mx1614 on 1/22/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(sayHi:) name:@"click" object:nil];
}

- (void)sayHi:(NSNotification *)nc
{
    NSAlert *alert = [[NSAlert alloc] init];
    NSString *name = nc.userInfo[@"name"];
    alert.messageText = @"系统提示:";
    alert.informativeText = [NSString stringWithFormat:@"你好,%@!", name];
    [alert addButtonWithTitle:@"你好"];
    [alert runModal];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)btn_input_name:(id)sender {
    NSViewController *vc = [[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"popover2"];
    NSPopover *popover = [[NSPopover alloc] init];
    popover.contentViewController = vc;
    popover.behavior = NSPopoverBehaviorTransient;
    [popover showRelativeToRect:_btn_input_name.bounds ofView:_btn_input_name preferredEdge:NSRectEdgeMaxY];
}





@end
