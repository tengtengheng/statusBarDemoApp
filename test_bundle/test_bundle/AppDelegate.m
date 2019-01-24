//
//  AppDelegate.m
//  test_bundle
//
//  Created by mx1614 on 2018/5/3.
//  Copyright © 2018年 mx1614. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"zhangsan",@"name",@"男",@"sex",@"玩",@"hobby", nil];
    NSLog(@"dic = %@", dic);
    
    NSString *str = dic[@"name"];
    NSLog(@"str = %@",str);
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSLog(@"version = %@", version);
    NSString *appname = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
    NSLog(@"appname = %@", appname);
    NSString *bundlepath = [[NSBundle mainBundle] bundlePath];
    NSLog(@"bundlepath = %@", bundlepath);
    NSString *respath = [[NSBundle mainBundle] resourcePath];
    NSLog(@"respath = %@", respath);
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSLog(@"mainbundle = %@", mainBundle);
    NSDictionary *infodictionary = [[NSBundle mainBundle] infoDictionary];
    NSLog(@"infodictionary = %@", infodictionary);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
