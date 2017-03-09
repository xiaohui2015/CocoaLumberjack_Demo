//
//  XHLogFormatter.m
//  CocoaLumberjack_Demo
//
//  Created by xiaohui on 2017/3/9.
//  Copyright © 2017年 xiaohui. All rights reserved.
//

#import "XHLogFormatter.h"

@implementation XHLogFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    
    NSString *logLevel = nil;
    
    switch (logMessage.flag) {
            
        case DDLogFlagDebug:
            logLevel = @"[Debug] -> ";
            break;
            
        case DDLogFlagInfo:
            logLevel = @"[Info] -> ";
            break;
            
        case DDLogFlagWarning:
            logLevel = @"[Warning] -> ";
            break;
            
        case DDLogFlagError:
            logLevel = @"[Error] -> ";
            break;
            
        default:
            logLevel = @"[Verbose] -> ";
            break;
    }
    
    NSString *formatterString = [NSString stringWithFormat:@"%@[%@ %@][line %lu] %@",
                           logLevel, logMessage.fileName, logMessage.function,
                           (unsigned long)logMessage.line, logMessage.message];
    return formatterString;
}

@end
