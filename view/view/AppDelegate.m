//
//  AppDelegate.m
//  view
//
//  Created by mx1614 on 1/17/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "AppDelegate.h"
#import "ffcontroller.h"
#import "oneview.h"
#import "secondviewcontroller.h"
#import "thirdviewcontroller.h"

@interface AppDelegate ()
@property (strong,nonatomic) IBOutlet NSWindow *window1;

//@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application


    [self window1];
    [self.window1 center];
    [self.window1 orderFront:nil];
    
    oneview *view = [[oneview alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.window1.contentView addSubview:view];

    
    
//    self.window1.contentViewController = [[ffcontroller alloc] init];
    
    NSLog(@"contentViewController : %@ , Controller.view : %@ , contentView : %@",self.window1.contentViewController,self.window1.contentViewController.view,self.window1.contentView);
//    self.window1.contentViewController = [[secondviewcontroller alloc] init];
    self.window1.contentViewController = [[thirdviewcontroller alloc] init];
//    self.window1.contentViewController = [[ffcontroller alloc]init];
    NSLog(@"contentViewController : %@ , Controller.view : %@ , contentView : %@",self.window1.contentViewController,self.window1.contentViewController.view,self.window1.contentView);
}

    



- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (NSWindow *)window1
{
    if (!_window1) {
        NSUInteger style = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable;
        _window1 = [[NSWindow alloc] initWithContentRect:CGRectMake(0, 0, 200, 300) styleMask:style backing:NSBackingStoreBuffered defer:YES];
    }
    return _window1;
}


@end
