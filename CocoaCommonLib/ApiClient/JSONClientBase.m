//
//  JSONClientBase.m
//  CocoaCommonLib
//
//  Created by mono on 9/1/13.
//  Copyright (c) 2013 mono. All rights reserved.
//

#import "JSONClientBase.h"
#import "CommonUtils.h"

@interface JSONClientBase ()
@property (nonatomic) NSString* baseUrl;
@end

@implementation JSONClientBase

-(id)initWithBaseUrl:(NSString*)baseUrl
{
    self = [super init];
    if (self) {
        _baseUrl = baseUrl;
    }
    return self;
}

-(NSString*)requestSynchronousWithJsonString:(NSString*)jsonString
{
    NSURLRequest* request = [self makeRequestWithJsonString:jsonString];
    
    NSURLResponse *response = nil;
    NSError *errr = nil;
    NSData *result = [NSURLConnection sendSynchronousRequest:request
                                           returningResponse:&response error:&errr];
    return result.decodeAsUTF8String;
}


-(void)requestAsynchronousWithJsonString:(NSString*)jsonString
                         completionBlock:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) completionBlock
{
    NSURLRequest* request = [self makeRequestWithJsonString:jsonString];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue new]
                           completionHandler:completionBlock];
}



-(NSURLRequest*)makeRequestWithJsonString:(NSString*)jsonString
{
    NSData *requestData = jsonString.encodeWithUTF8;
    NSString* urlString = [_baseUrl stringByAppendingString:@"users"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:15.0];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@(requestData.length).stringValue forHTTPHeaderField:@"Content-Length"];
    request.HTTPBody = requestData;
    return request;
}
@end
