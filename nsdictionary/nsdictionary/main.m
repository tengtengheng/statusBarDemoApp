//
//  main.m
//  nsdictionary
//
//  Created by mx1614 on 12/31/18.
//  Copyright © 2018 ludy. All rights reserved.
//

#import <Foundation/Foundation.h>

void test3()
{
    NSRange range1 = {2, 0};
    NSLog(@"loc = %ld, len = %ld", range1.location, range1.length);
    
    NSRange range2;
    range2.location = 1;
    range2.length = 23;
    NSLog(@"loc = %ld, len = %ld", range2.location, range2.length);
    
    NSRange range3 = NSMakeRange(45, 3);
    NSLog(@"loc = %ld, len = %ld", range3.location, range3.length);
}

void test2(){
    NSString *str = @"<itcast>传智播客</itcast>";
    unsigned long loc = [str rangeOfString:@">"].location+1;
    unsigned long len = [str rangeOfString:@"</"].location - loc;
    
    NSLog(@"%ld, %ld", loc, len);
    NSRange range = {loc, len};
    NSString *newStr = [str substringWithRange:range];
    NSLog(@"newStr = %@", newStr);
    
}

void test1(){
    
    test2();
    NSString *str = @"ISo.itcast.CN";
    NSLog(@"str.length = %ld", str.length);
    unsigned long len = str.length;
    for (int i = 0; i < len; i++) {
        unichar c = [str characterAtIndex:i];
        printf("%c ", c);
    }
    
    
    NSString *newStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet uppercaseLetterCharacterSet]];
    NSLog(@"newstr = %@", newStr);
    
    char ch[] = "itcast";
    NSString *coStr = [NSString stringWithUTF8String:ch];
    NSLog(@"costr = %@", coStr);
    
}

void test()
{
    NSDictionary *dic3 = @{@"zs":@"zhangsan", @"ls":@"lisi", @"arr":@"fengjie"};
    NSLog(@"%@", dic3[@"arr"]);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        test3();
        test1();
        NSArray *arr = @[@"1", @"2", @"one"];
        NSDictionary *dict = @{@"1":@"one", @"2":@"two"};
        NSDictionary *dict3 = @{@"zs":@"zhangsan", @"dict":dict, @"arr":arr};
        bool flag = [dict3 writeToFile:@"/Users/mx1614/Desktop/dic.plist" atomically:YES];
        if (flag) {
            NSLog(@"write successfully!");
        }
        NSDictionary *dict4 = [NSDictionary dictionaryWithContentsOfFile:@"/Users/mx1614/Desktop/dic.plist"];
        NSArray *arr2 = dict4[@"arr"];
        NSLog(@"%@", arr2);
        
        NSDictionary *dict5 = dict4[@"dict"];
        NSLog(@"%@",dict5);
        
        NSString *tel = @"400-517-517";
        NSArray *arrtel = [tel componentsSeparatedByString:@"-"];
        NSLog(@"arrtel = %@", arrtel);
        
        NSArray *arrnew = @[@"1", @"2", @"3", @"4", @"5", @"six", @"seven", @"8"];
        NSString *stttt = [arrnew componentsJoinedByString:@"-"];
        NSLog(@"%@", stttt);
        
        NSArray *arr4 = [NSArray array];
        NSLog(@"%@",arr4);
        
        NSArray *arraa = @[@"1", @"2", @"3", @"4", @"5", @"six", @"seven", @"8"];
        BOOL isSuccess = [arraa writeToFile:@"/Users/mx1614/Desktop/arr.xml" atomically:YES];
        if (isSuccess) {
            NSLog(@"write successfully");
        }
        
        NSArray *arraa2 = [NSArray arrayWithContentsOfFile:@"/Users/mx1614/Desktop/arr.xml"];
        NSLog(@"arraa2 = %@", arraa2);
        
    }
    return 0;
}
