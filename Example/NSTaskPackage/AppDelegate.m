//
//  AppDelegate.m
//  NSTaskPackage
//
//  Created by meitu on 2018/7/9.
//  Copyright © 2018年 lcd. All rights reserved.
//

#import "AppDelegate.h"
#import "DDTask.h"
#import "DDTask+zip.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
//    [DDTask runWithConfig:^(DDTaskConfig *config) {
//
//        config.isAsync = YES;
//        config.params = @"python";
//        config.launchPath = @"/usr/bin/which";
//
//    } completionHandler:^(BOOL isSuccess, NSString *outputString, NSString *errorString) {
//
//        if (isSuccess) {
//            NSLog(@"成功了 %@,%@",outputString, errorString);
//        } else {
//            NSLog(@"失败了 %@,%@",outputString, errorString);
//        }
//    }];
    
//    NSString *src = @"/Users/meitu/Desktop/123";
//    NSString *desc = @"/Users/meitu/Desktop/test.ipa";
//    [DDTask zip:src toPath:desc completionHandler:^(BOOL success, NSString *result) {
//
//    }];
    
    NSString *src = @"/Users/meitu/Desktop/456.zip";
//    NSString *desc = @"/Users/meitu/Desktop/test.ipa";
    [DDTask upzip:src toPath:@"/Users/meitu/Desktop" completionHandler:^(BOOL success) {
        
    }];

}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
