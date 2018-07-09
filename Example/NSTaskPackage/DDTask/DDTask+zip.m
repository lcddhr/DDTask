//
//  DDTask+zip.m
//  NSTaskPackage
//
//  Created by meitu on 2018/7/9.
//  Copyright © 2018年 lcd. All rights reserved.
//

#import "DDTask+zip.h"

@implementation DDTask (zip)
+ (void)zip:(NSString *)path toPath:(NSString *)toPath completionHandler:(void(^)(BOOL success, NSString *result))completionHandler {
    
    NSString *launchPath = @"/usr/bin/zip";
    NSString *currentDirectory = path;
    NSString *params = [NSString stringWithFormat:@"-qry %@ .", path];

    [DDTask runWithConfig:^(DDTaskConfig *config) {
        config.launchPath = launchPath;
        config.directoryPath = currentDirectory;
        config.params = params;
    } completionHandler:^(BOOL isSuccess, NSString *outputString, NSString *errorString) {

        if (isSuccess) {
            if ([[NSFileManager defaultManager] fileExistsAtPath:toPath]) {
                NSLog(@"成功压缩");
            } else {
                NSLog(@"压缩失败");
            }
        }
    }];
}

+ (void)upzip:(NSString *)filePath toPath:(NSString *)toPath completionHandler:(void(^)(BOOL success))completionHandler {
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) return completionHandler(NO);
    
    [DDTask runWithConfig:^(DDTaskConfig *config) {
        config.launchPath = @"/usr/bin/unzip";
        config.params = [NSString stringWithFormat:@"-q %@ -d %@", filePath,toPath];
    } completionHandler:^(BOOL isSuccess, NSString *outputString, NSString *errorString) {
        if (isSuccess) {
            NSLog(@"解压缩成功");
        } else {
            NSLog(@"解压缩失败");
        }
    }];
}
@end
