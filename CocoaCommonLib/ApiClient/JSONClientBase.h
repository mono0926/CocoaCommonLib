//
//  JSONClientBase.h
//  CocoaCommonLib
//
//  Created by mono on 9/1/13.
//  Copyright (c) 2013 mono. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONClientBase : NSObject

-(id)initWithBaseUrl:(NSString*)baseUrl
                path:(NSString*)path
         accessToken:(NSString*)accessToken;
-(NSString*)requestSynchronousWithJsonString:(NSString*)jsonString;
-(void)requestAsynchronousWithJsonString:(NSString*)jsonString
                         completionBlock:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) completionBlock;
@property (nonatomic) NSString* accessToken;
@end
