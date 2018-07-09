//
//  DDTask.m
//  NSTaskPackage
//
//  Created by meitu on 2018/7/9.
//  Copyright © 2018年 lcd. All rights reserved.
//

#import "DDTask.h"
#import "DDRunloop.h"


@implementation DDTask

+ (void)runWithConfig:(DDTaskConfigBlock)block completionHandler:(DDTaskCompletionHandler)completionHandler {
    
    DDTaskConfig *config = [[DDTaskConfig alloc] init];
    if (block) {
        block(config);
    }
#if DEBUG
    NSLog(@"执行的命令是 %@ %@", config.launchPath,config.params);
#endif
    
    NSArray *params = [config.params componentsSeparatedByString:@" "];
    
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:config.launchPath];
    if (config.directoryPath) {
        [task setCurrentDirectoryPath:config.directoryPath];
    }
    NSMutableArray *arguements = [NSMutableArray arrayWithArray:params];
    [task setArguments:arguements];
    
    
    NSPipe *standardOutputPipe = [NSPipe pipe];
    [task setStandardOutput:standardOutputPipe];
    
    NSPipe *standardErrorPipe = [NSPipe pipe];
    [task setStandardError:standardErrorPipe];
    
    if (config.isAsync) {
        [task launch];
        [self asyncResponseWithTask:task completionHandler:completionHandler];
    } else {
        [task waitUntilExit];
        [self responseWithTask:task completionHandler:completionHandler];
    }
}

+ (void)asyncResponseWithTask:(NSTask *)task completionHandler:(DDTaskCompletionHandler)completionHandler {
    DDRunloop *loop = [DDRunloop new];
    [loop run:^{
        if (task.isRunning == 0) {
            [loop stop:^{
                [self responseWithTask:task completionHandler:completionHandler];
            }];
        }
    }];
}

+ (void)responseWithTask:(NSTask *)task completionHandler:(DDTaskCompletionHandler)completionHandler {
    
    NSFileHandle *outputHandler = [task.standardOutput fileHandleForReading];
    NSFileHandle *errorHandler = [task.standardError fileHandleForReading];
    
    NSString *outputString = [[NSString alloc] initWithData:[outputHandler readDataToEndOfFile] encoding:NSASCIIStringEncoding];
    NSString *errorString = [[NSString alloc] initWithData:[errorHandler readDataToEndOfFile] encoding:NSASCIIStringEncoding];
    if (task.terminationStatus == 0) {
        completionHandler(YES, outputString,errorString);
    } else {
        completionHandler(NO, outputString,errorString);
    }
}
@end
