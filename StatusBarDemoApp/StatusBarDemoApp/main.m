//
//  main.m
//  StatusBarDemoApp
//
//  Created by mx1614 on 1/20/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    NSApplication *app = [NSApplication sharedApplication];
    id delegate = [[AppDelegate alloc] init];
    app.delegate = delegate;
    return NSApplicationMain(argc, argv);
}
