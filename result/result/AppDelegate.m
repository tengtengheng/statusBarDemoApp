//
//  AppDelegate.m
//  result
//
//  Created by mx1614 on 1/3/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSString *s = nil;
    NSLog(@"s = %@", s);
    if(!s)
    {
        NSLog(@"s = nil");
    }else
    {
        NSLog(@"s != nil");
    }
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
