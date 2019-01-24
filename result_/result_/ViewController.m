//
//  ViewController.m
//  result_
//
//  Created by mx1614 on 1/3/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize textfield;

- (void)viewDidLoad {
    [super viewDidLoad];
    filePath = @"/vault/AUTO";
    resultCnt = 0;
    // Do any additional setup after loading the view.
    textfield.stringValue = @"I am here for writing result,\
    Please do not close me,thanks!!!";

    
    dispatch_async(dispatch_get_global_queue(0, 0),^{
        while (true) {

            [self writerResult];
        }
    });
    

}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];


}

- (void)writerResult
{    
        NSFileManager *fm = [NSFileManager defaultManager];
        NSArray *fileArr = [fm contentsOfDirectoryAtPath:filePath error:nil];
        NSMutableString *mutStr = [[NSMutableString alloc] init];
        NSString *tempStr = [[NSString alloc] init];
        NSString *tempPath = [[NSString alloc] init];
        resultCnt = 0;
        for (NSString *str in fileArr) {
            if ([str containsString:@"tempR"]) {
                resultCnt++;
            }
        }
        if (resultCnt == 4) {
            for (NSString *ss in fileArr) {
                if ([ss containsString:@"tempR"]) {
                    tempPath = [filePath stringByAppendingPathComponent:ss];
                    tempStr = [NSString stringWithContentsOfFile:tempPath encoding:NSUTF8StringEncoding error:nil];
                    if (tempStr) {
                        [mutStr appendString:tempStr];
                        [mutStr appendString:@"\n"];
                    }
                    [fm removeItemAtPath:tempPath error:nil];
                }
            }
            [mutStr writeToFile:@"/vault/AUTO/result.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
        }
        [NSThread sleepForTimeInterval:1];
}


@end
