//
//  AppDelegate.m
//  StatusBarDemoApp
//
//  Created by mx1614 on 1/20/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "AppDelegate.h"
#import "CTPopoverViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) NSStatusItem *demoItem;
@property (nonatomic, strong) NSPopover *popover;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.demoItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    NSImage *image = [NSImage imageNamed:@"settings"];
    [self.demoItem.button setImage:image];
    
    _popover = [[NSPopover alloc] init];
    _popover.behavior = NSPopoverBehaviorTransient;
    _popover.appearance = [NSAppearance appearanceNamed:NSAppearanceNameVibrantLight];
    _popover.contentViewController = [[CTPopoverViewController alloc] initWithNibName:@"CTPopoverViewController" bundle:nil];
    
    self.demoItem.button.target = self;
    self.demoItem.button.action = @selector(showMyPopover:);
    __weak typeof(self) weakSelf = self;
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSEventMaskLeftMouseDown handler:^(NSEvent * event) {
        if (weakSelf.popover.isShown) {
            [weakSelf.popover close];
        }
    }];
    
}

- (void)showMyPopover:(NSStatusBarButton *)button
{
    [_popover showRelativeToRect:button.bounds ofView:button preferredEdge:NSRectEdgeMaxY];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
