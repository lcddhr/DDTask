//
//  DDTaskConfig.h
//  NSTaskPackage
//
//  Created by meitu on 2018/7/9.
//  Copyright © 2018年 lcd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDTaskConfig : NSObject

@property (nonatomic, copy) NSString *launchPath;
@property (nonatomic, copy) NSString *params;
@property (nonatomic, copy) NSString *directoryPath;

@property (nonatomic, assign) BOOL isAsync;
@end
