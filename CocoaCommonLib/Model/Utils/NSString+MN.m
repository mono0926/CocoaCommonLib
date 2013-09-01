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
@end
