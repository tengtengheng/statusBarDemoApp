//
//  main.m
//  zhengze
//
//  Created by mx1614 on 1/11/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSString *filepath = @"/vault/AUTO";
        NSString *strRegex = @".*Result\\d.txt";
        NSString *file = @"tempResult1.txt";
        NSError *error = NULL;
//        NSPredicate *pathtest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strRegex];
//        NSLog(@"pathtest = %@", pathtest);
//        BOOL contain = [pathtest evaluateWithObject:file];
//        NSLog(@"contain = %d", contain);
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@".*Result\\d.txt" options:NSRegularExpressionAllowCommentsAndWhitespace error:&error];
        NSTextCheckingResult *result = [regex firstMatchInString:file options:0 range:NSMakeRange(0, [file length])];
        if (result) {
            NSLog(@"result = %@", [file substringWithRange:result.range]);
        }
    }
    return 0;
}
