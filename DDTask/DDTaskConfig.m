//
//  DDTaskConfig.m
//  NSTaskPackage
//
//  Created by meitu on 2018/7/9.
//  Copyright © 2018年 lcd. All rights reserved.
//

#import "DDTaskConfig.h"

@implementation DDTaskConfig

-(instancetype)init {
    self = [super init];
    if (self) {
        self.launchPath = @"/bin/sh";
        self.params = @"";
        self.isAsync = YES;
    }
    return self;
}
@end
