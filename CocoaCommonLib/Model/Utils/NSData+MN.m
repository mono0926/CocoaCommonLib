//
//  NSData+MN.m
//  CocoaCommonLib
//
//  Created by mono on 9/1/13.
//  Copyright (c) 2013 mono. All rights reserved.
//

#import "NSData+MN.h"

@implementation NSData (MN)
-(NSString *)decodeAsUTF8String
{
    return [[NSString alloc]initWithData:self encoding:NSUTF8StringEncoding];
}
@end
