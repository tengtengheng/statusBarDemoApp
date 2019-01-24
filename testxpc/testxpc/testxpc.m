//
//  testxpc.m
//  testxpc
//
//  Created by mx1614 on 2018/5/2.
//  Copyright © 2018年 mx1614. All rights reserved.
//

#import "testxpc.h"

@implementation testxpc

// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    system("touch /Users/mx1614/bb.txt");
    NSString *response = [aString uppercaseString];
    NSLog(@"hello");
    NSFileManager *fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:@"/Users/mx1614/cc.txt"]) {
        [fm createFileAtPath:@"/Users/mx1614/cc.txt" contents:nil attributes:nil];
    }
    reply(response);
}

@end
