//
//  taskClass.h
//  task_test2
//
//  Created by mx1614 on 1/23/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface taskClass : NSObject

- (NSString *)getOutPutFromPath:(NSString *)path arguments:(NSArray *)args status:(int *)status;
@end

NS_ASSUME_NONNULL_END
