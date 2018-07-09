//
//  DDRunloop.m
//  NSTaskPackage
//
//  Created by meitu on 2018/7/9.
//  Copyright © 2018年 lcd. All rights reserved.
//

#import "DDRunloop.h"

static dispatch_queue_t DDRunLoopQueue() {
    static dispatch_queue_t __runloopQueue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __runloopQueue = dispatch_queue_create("com.task.queue", NULL);
    });
    return __runloopQueue;
}


@implementation DDRunloop

- (instancetype)init {
    if (self = [super init]) {
        self.isSuspend = NO;
    }
    return self;
}

-(void)run:(void (^)(void))block {
    self.isSuspend = NO;
    dispatch_async(DDRunLoopQueue(), ^{
        while (!self.isSuspend) {
            block();
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
    });
}

- (void)stop:(void (^)(void))complete {
    self.isSuspend = YES;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        complete();
    });
}


@end
