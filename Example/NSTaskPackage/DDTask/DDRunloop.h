//
//  DDRunloop.h
//  NSTaskPackage
//
//  Created by meitu on 2018/7/9.
//  Copyright © 2018年 lcd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDRunloop : NSObject

@property (nonatomic) BOOL isSuspend;

- (void)run:(void (^)(void))block;
- (void)stop:(void (^)(void))complete;

@end
