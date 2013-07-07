//
//  NSDate+MN.h
//  cookpad
//
//  Created by mono on 6/15/13.
//  Copyright (c) 2013 mono. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MN)
/*!
 * この日付をローカル時刻でyyyyMMdd型の文字列に変換する
 */
@property (nonatomic, readonly) NSString* compactDateStringInLocalTimeZone;
@property (nonatomic, readonly) NSString* compactDateTimeStringInLocalTimeZone;
@property (nonatomic, readonly) NSString* compactDateStringInJapanese;
@property (nonatomic, readonly) NSString* compactDateTimeStringInJapanese;
/*!
 * yyyyMMddHHmmss 形式の文字列で表現される日時をローカル時刻と会社s串てNSDateを取得します
 */
+(NSDate*)dateWithCompactDateStringInLocalTimeZone:(NSString*)compactDateString;
+(NSDate*)dateWithCompactDateTimeStringInLocalTimeZone:(NSString*)compactDateString;

@end
