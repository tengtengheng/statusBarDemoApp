//
//  taskClass.m
//  task_test2
//
//  Created by mx1614 on 1/23/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "taskClass.h"

@implementation taskClass

- (NSString *)getOutPutFromPath:(NSString *)path arguments:(NSArray *)args status:(int *)status
{
    NSTask *task = [NSTask new];
    task.launchPath = path;
    task.arguments = args;
    
    NSPipe *pipe = [NSPipe pipe];
    task.standardOutput = pipe;
    
    [task launch];
    [task waitUntilExit];
    
    int _status = [task terminationStatus];
    if (status) {
        *status = _status;
    }else{
        assert(_status = 0);
    }
    
    NSData *data = [pipe.fileHandleForReading readDataToEndOfFile];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


@end
