//
//  NSString+MN.h
//  CocoaCommonLib
//
//  Created by mono on 9/1/13.
//  Copyright (c) 2013 mono. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MN)
@property (nonatomic, readonly) NSData* encodeWithUTF8;
+(NSString*)uuidString;
@end
