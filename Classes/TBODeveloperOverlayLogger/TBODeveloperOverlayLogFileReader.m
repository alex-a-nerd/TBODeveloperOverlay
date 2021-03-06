//
//  TBODeveloperOverlayLogFileReader.m
//  TBODeveloperOverlay
//
//  Created by Cornelius Horstmann on 16.06.16.
//  Copyright © 2016 TBO INTERACTIVE. All rights reserved.
//

#import "TBODeveloperOverlayLogFileReader.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

@implementation TBODeveloperOverlayLogFileReader

+ (NSString *)lastLogMessagesLimitedToCharacterCount:(NSUInteger)maxCharacterCount inFilelogger:(DDFileLogger *)fileLogger {
    NSArray<NSString *> *sortedLogFilePaths = [[fileLogger logFileManager] sortedLogFilePaths];
    return [self lastLogMessagesLimitedToCharacterCount:maxCharacterCount fromFilePaths:sortedLogFilePaths];
}

+ (NSString *)lastLogMessagesLimitedToCharacterCount:(NSUInteger)maxCharacterCount fromFilePaths:(NSArray<NSString *> *)sortedLogFilePaths  {
    NSMutableString *logMessages = [NSMutableString string];
    NSFileManager *fileManager = [NSFileManager new];
    for (NSString *logFilePath in [sortedLogFilePaths objectEnumerator]) {
        NSData *logData = [fileManager contentsAtPath:logFilePath];
        if (logData.length > 0) {
            NSString *logString = [[NSString alloc] initWithBytes:logData.bytes length:logData.length encoding:NSUTF8StringEncoding];
            [logMessages insertString:logString atIndex:0];
        }
        if (logMessages.length >= maxCharacterCount) {
            break;
        }
    }
    if ([logMessages length] > maxCharacterCount) {
        logMessages = (NSMutableString *)[logMessages substringWithRange:NSMakeRange([logMessages length]-maxCharacterCount, maxCharacterCount)];
    }
    return logMessages;
}

@end
