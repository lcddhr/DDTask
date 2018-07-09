//
//  DDTask.h
//  NSTaskPackage
//
//  Created by meitu on 2018/7/9.
//  Copyright © 2018年 lcd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDTaskConfig.h"

typedef void(^DDTaskConfigBlock)(DDTaskConfig *config);
typedef void(^DDTaskCompletionHandler)(BOOL isSuccess, NSString *outputString, NSString *errorString);

@interface DDTask : NSObject


+ (void)runWithConfig:(DDTaskConfigBlock)block completionHandler:(DDTaskCompletionHandler)completionHandler;
@end
