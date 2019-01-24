//
//  testxpc.h
//  testxpc
//
//  Created by mx1614 on 2018/5/2.
//  Copyright © 2018年 mx1614. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "testxpcProtocol.h"

// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@interface testxpc : NSObject <testxpcProtocol>
@end
