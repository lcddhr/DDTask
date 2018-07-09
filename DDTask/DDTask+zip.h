//
//  DDTask+zip.h
//  NSTaskPackage
//
//  Created by meitu on 2018/7/9.
//  Copyright © 2018年 lcd. All rights reserved.
//

#import "DDTask.h"

@interface DDTask (zip)

+ (void)zip:(NSString *)path toPath:(NSString *)toPath completionHandler:(void(^)(BOOL success, NSString *result))completionHandler;

+ (void)upzip:(NSString *)filePath toPath:(NSString *)toPath completionHandler:(void(^)(BOOL success))completionHandler;
@end
