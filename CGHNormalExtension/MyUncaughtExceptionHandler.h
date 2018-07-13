//
//  MyUncaughtExceptionHandler.h
//  惠多多
//
//  Created by Jagain on 2018/3/6.
//  Copyright © 2018年 Jagain. All rights reserved.
//

#import <Foundation/Foundation.h>
// 崩溃日志
@interface MyUncaughtExceptionHandler : NSObject
+ (void)setDefaultHandler;
+ (NSUncaughtExceptionHandler *)getHandler;
+ (void)TakeException:(NSException *) exception;
@end
