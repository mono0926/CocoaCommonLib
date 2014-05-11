//
//  NSString+MN.m
//  CocoaCommonLib
//
//  Created by mono on 9/1/13.
//  Copyright (c) 2013 mono. All rights reserved.
//

#import "NSString+MN.h"

@implementation NSString (MN)
-(NSData *)encodeWithUTF8
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

+(NSString*)uuidString {
    CFUUIDRef uuid = CFUUIDCreate(nil);
    NSString *str = (__bridge_transfer NSString*)CFUUIDCreateString(nil, uuid);
    CFRelease(uuid);
    // 小文字に変換
    return [str lowercaseString];
}
@end
