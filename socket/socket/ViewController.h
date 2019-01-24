//
//  ViewController.h
//  socket
//
//  Created by mx1614 on 1/5/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#import "ClientModel.h"
static int const kMaxConnectCount = 5;

@interface ViewController : NSViewController


@property (weak) IBOutlet NSTextField *textField;
@property (unsafe_unretained) IBOutlet NSTextView *textView;
@property (nonatomic, strong) NSMutableArray *clientArray;
@property (nonatomic, strong)NSMutableArray *clientNameArray;


@end

