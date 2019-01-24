//
//  main.m
//  ttest
//
//  Created by mx1614 on 1/2/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSString * str = @"";
        NSString *str2;
        NSLog(@"str = %@, str2 = %@", str, str2);
        if (str == NULL) {
            NSLog(@"str == null");
        }
        
        if (str2 == NULL) {
            NSLog(@"str2 == null");
        }
    }
    return 0;
}
