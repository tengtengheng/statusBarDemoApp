//
//  AppDelegate.m
//  ludytest
//
//  Created by mx1614 on 1/17/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "ScaryBugDoc.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, strong) IBOutlet MasterViewController *masterViewController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil];
    
    ScaryBugDoc *bug1 = [[ScaryBugDoc alloc] initWithTitle:@"Patato bug" rating:4 thumbImage:[NSImage imageNamed:@"1.jpg"] fullImage:[NSImage imageNamed:@"5.jpg"]];
    ScaryBugDoc *bug2 = [[ScaryBugDoc alloc] initWithTitle:@"House centepede" rating:3 thumbImage:[NSImage imageNamed:@"2.jpg"] fullImage:[NSImage imageNamed:@"6.jpg"]];
    ScaryBugDoc *bug3 = [[ScaryBugDoc alloc] initWithTitle:@"Wolf Spider" rating:2 thumbImage:[NSImage imageNamed:@"3.jpg"] fullImage:[NSImage imageNamed:@"7.jpg"]];
    ScaryBugDoc *bug4 = [[ScaryBugDoc alloc] initWithTitle:@"Lady bug" rating:1 thumbImage:[NSImage imageNamed:@"4.jpg"] fullImage:[NSImage imageNamed:@"8.jpg"]];

    NSMutableArray *bugs = [NSMutableArray arrayWithObjects:bug1, bug2, bug3, bug4, nil];
    self.masterViewController.bugs = bugs;
    NSLog(@"bugs = %@", bugs);
    
    [self.window.contentView addSubview:self.masterViewController.view];
    self.masterViewController.view.frame = self.window.contentView.bounds;
    
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
