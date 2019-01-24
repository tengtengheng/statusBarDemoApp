//
//  ClientModel.h
//  socket
//
//  Created by mx1614 on 1/6/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClientModel : NSObject

@property(nonatomic,assign)int clientSocket;
@property(nonatomic,copy)NSString *clientName;

@end

NS_ASSUME_NONNULL_END
