//
//  main.m
//  tertest
//
//  Created by mx1614 on 2018/5/31.
//  Copyright © 2018年 ludy. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef NS_ENUM(NSString*, hh)
//{
//    WORLD,
//    This
//};

typedef NS_ENUM(uint8_t,aa)
{
    UNIPOLA,
    POPLA
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        
        time_t t = time(NULL);
        struct tm *it = localtime(&t);
        int hour = it->tm_hour;
        NSLog(@"hour = %d", hour);
        char *timeStr = asctime(it);
        NSLog(@"timestr = %s", timeStr);
        
        NSLog(@"Hello, World!");
        NSDate *date = [NSDate date];
        NSLog(@"date = %@", date);
    
        
        
        
        float aa = 0.002;
        float bb = 1.5E-03;
        NSLog(@"a = %f, b = %f", aa, bb);
        
        
        dispatch_semaphore_t a = dispatch_semaphore_create(0);
        
        
        NSString *sss = @"ludychen88";
        NSRange range = NSMakeRange(6, 2);
        NSString *need = [sss substringWithRange:range];
        NSLog(@"need = %@", need);
        NSString *need2= [sss substringFromIndex:4];
        NSLog(@"need2 = %@", need2);
        NSString *need3 = [sss substringToIndex:5];
        NSLog(@"need3 = %@", need3);
        
        
        
        
        NSString *str = [[NSString alloc] init];
        NSArray *arr = [[NSArray alloc] init];
        NSString *str2 = nil;
        NSLog(@"arr = %@", arr);
        if (str) {
            NSLog(@"nil");
        }else{
            
            NSLog(@"not nil");
        }
 
        NSLog(@"%d %d", UNIPOLA,POPLA);
        
        NSString *filepath = @"/vault/Atlas/Units/openUART/UART_SMC.log";
//        NSString *filepath = @"/vault/Atlas/Units/openUART/UART_SMC.txt";

        NSFileHandle *fh;
        fh = [NSFileHandle fileHandleForUpdatingAtPath:filepath];
//        fh = [NSFileHandle fileHandleForReadingAtPath:filepath];
//        fh = [NSFileHandle fileHandleForWritingAtPath:filepath];
        if (fh) {
            NSLog(@"read ok");
        }else{
            
            NSLog(@"read fail");
        }
        
        NSString * cmd = [NSString stringWithFormat:
                          @"/bin/ps aux|grep \"FixtureDiscoveryService\" | grep -v grep > /dev/null"];
        BOOL isSpawned = NO;
        NSLog(@"cmd = %@", cmd);
        isSpawned = (system([cmd UTF8String]) == 0);
        
        if (isSpawned)
        {
            NSLog(@"ok");
//            FSLog(FSError, @"Discovery is not responding! Attempting to restart it....");
//            system("/usr/bin/killall -9 FixtureDiscoveryService");
        }
        else
        {
            NSLog(@"no");
//            FSLog(FSError, @"Discovery is not running!!!");
        }
        NSMutableArray *m_pin = [[NSMutableArray alloc] init];
        for (int i = 1; i < 33; i++)
        {
            NSMutableDictionary *pinRow = [[NSMutableDictionary alloc] init];
            
            pinRow[@"_pin"] = @(i);
            pinRow[@"_row"] = @(0);
            pinRow[@"type"] = @(0);
            
            [m_pin addObject:pinRow];
        }
        
        for (int i = 1; i < 33; i++)
        {
            NSMutableDictionary *pinRow = [[NSMutableDictionary alloc] init];
            
            pinRow[@"_pin"] = @(i);
            pinRow[@"_row"] = @(1);
            pinRow[@"type"] = @(0);
            
            [m_pin addObject:pinRow];
        }
        NSLog(@"m_pin = %@", m_pin);
    }
    return 0;
}
