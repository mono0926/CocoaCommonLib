//
//  JSONClientBase.h
//  CocoaCommonLib
//
//  Created by mono on 9/1/13.
//  Copyright (c) 2013 mono. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONClientBase : NSObject

-(id)initWithBaseUrl:(NSString*)baseUrl;
-(NSString*)requestSynchronousWithJsonString:(NSString*)jsonString;
-(void)requestAsynchronousWithJsonString:(NSString*)jsonString
                         completionBlock:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) completionBlock;
@end
