//
//  main.m
//  task_test2
//
//  Created by mx1614 on 1/23/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "taskClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        int res;
        taskClass *tt = [[taskClass alloc] init];
        NSString *str2 = [tt getOutPutFromPath:@"/bin/bash" arguments:@[@"-c", @"cd ~/"] status:&res];
        NSString *str = [tt getOutPutFromPath:@"/bin/bash" arguments:@[@"-c", @"cd /; ls ./"] status:&res];
        NSLog(@"str = %@", str);
    }
    return 0;
}
