//
//  main.m
//  test_oc
//
//  Created by mx1614 on 2018/5/2.
//  Copyright © 2018年 mx1614. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <unistd.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *programming = [NSString stringWithUTF8String:getprogname()];
        NSLog(@"programming = %@", programming);
    
        int data = 3;
        __block int mainData = 0;
        __block dispatch_semaphore_t sem = dispatch_semaphore_create(0);
//        NSLog(@"sem = %d", (int)sem);
        dispatch_queue_t queue2 = dispatch_queue_create("queue", NULL);
        dispatch_async(queue2, ^{
            int sum = 0;
            
            for (int i = 0; i < 5; i++) {
                sum+= data;
                NSLog(@">>sum: %d", sum);
//                sleep(1);
            }
           dispatch_semaphore_signal(sem);
//            NSLog(@"a = %ld", a);
            
        });
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
        for (int j = 0; j < 5; j++) {
            mainData++;
            NSLog(@">> main data: %d", mainData);
        }
        
        
        
        dispatch_group_t group = dispatch_group_create();
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        for (int i = 0; i < 5; i++)
        {
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            //注意这里信号量从10开始递减,并不会阻塞循环.循环10次,递减到0的时候,开始阻塞.
            NSLog(@"-------");
            dispatch_group_async(group, queue, ^{
                NSLog(@"%i",i);
//                sleep(1);
               long x1 = dispatch_semaphore_signal(semaphore);
                NSLog(@"x1 = %ld", x1);
            });//创建一个新线程,并在线程结束后,发送信号量,通知阻塞的循环继续创建新线程.
        }
       long y = dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
        NSLog(@"y = %ld", y);
        
        for (int j = 0; j < 5; j++) {
            mainData += 2;
            NSLog(@">> main data: %d", mainData);
        }
        NSLog(@"am i end last?");
        
        
       // 信号量测试
//        dispatch_semaphore_t signal;
//        signal = dispatch_semaphore_create(1);
//        __block long x = 0;
//        NSLog(@"0_x:%ld",x);
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            sleep(1);
//            NSLog(@"waiting");
//            x = dispatch_semaphore_signal(signal);
//            NSLog(@"1_x:%ld",x);
//
//            sleep(2);
//            NSLog(@"waking");
//            x = dispatch_semaphore_signal(signal);
//            NSLog(@"2_x:%ld",x);
//        });
//
//        x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
//        NSLog(@"3_x:%ld",x);
//
//        x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
//        NSLog(@"wait 2");
//        NSLog(@"4_x:%ld",x);
//
//        x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
//        NSLog(@"wait 3");
//        NSLog(@"5_x:%ld",x);
        
        unsigned int w1 = 0xA0A0A0A0, w2 = 0XFFFF0000,
        w3 = 0x00007777;
        NSLog(@"%x %x %x", w1 & w2, w1 | w2, w1 ^ w2);
        NSLog(@"%x %x %x", ~w1, ~w2, ~w3);
        NSLog(@"%x %x %x", w1 ^ w1, w1 & ~w2, w1 | w2 | w3);
        NSLog(@"%x %x", w1 | w2 & w3, w1 | w2 & ~w3);
        NSLog(@"%x %x", ~(~w1 & ~w2), ~(~w1 | ~w2));
        
    }
    return 0;
}
