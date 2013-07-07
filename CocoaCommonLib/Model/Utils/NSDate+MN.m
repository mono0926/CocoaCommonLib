//
//  NSDate+MN.m
//  cookpad
//
//  Created by mono on 6/15/13.
//  Copyright (c) 2013 mono. All rights reserved.
//

#import "NSDate+MN.h"

@implementation NSDate (MN)
-(NSString *)compactDateStringInLocalTimeZone {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	[formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
    [formatter setDateFormat:@"yyyyMMdd"];
    return [formatter stringFromDate:self];
}

-(NSString *)compactDateTimeStringInLocalTimeZone {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	[formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    return [formatter stringFromDate:self];
}

-(NSString *)compactDateStringInJapanese {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	[formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    return [formatter stringFromDate:self];
}
-(NSString *)compactDateTimeStringInJapanese {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	[formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
    [formatter setDateFormat:@"yyyy年MM月dd日hh時mm分"];
    return [formatter stringFromDate:self];
}

+(NSDate *)dateWithCompactDateStringInLocalTimeZone:(NSString *)compactDateString {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	[formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
    [formatter setDateFormat:@"yyyyMMdd"];
    return [formatter dateFromString:compactDateString];
}

+(NSDate *)dateWithCompactDateTimeStringInLocalTimeZone:(NSString *)compactDateString {
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	[formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    return [formatter dateFromString:compactDateString];
}
@end
