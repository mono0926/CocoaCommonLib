//
//  NSManagedObjectContext+MN.m
//  cookpad_ios
//
//  Created by mono on 6/5/13.
//  Copyright (c) 2013 mono. All rights reserved.
//

#import "NSManagedObjectContext+MN.h"

@implementation NSManagedObjectContext (MN)
static const NSString* NSManagedObjectContextUserInfoKeyIsMerging = @"NSManagedObjectContextUserInfoKeyIsMerging";

- (void)setIsMerging:(BOOL)isMerging{
    [self.userInfo setObject:@(isMerging) forKey:NSManagedObjectContextUserInfoKeyIsMerging];
}

- (BOOL)isMerging{
    NSNumber* number = [self.userInfo objectForKey:NSManagedObjectContextUserInfoKeyIsMerging];
    return number.boolValue;
}

-(id)single:(NSFetchRequest *)request{
    NSError *error = nil;
    NSArray* res = [self executeFetchRequest:request error:&error];
    if(error){
        [[NSException
          exceptionWithName:@"executeFetchRequestError"
          reason:[NSString stringWithFormat:@"%d", (int)error.code]
          userInfo:[NSDictionary dictionaryWithObject:error forKey:@"error"]]
         raise];
        
        return(nil);
    }
    NSAssert(res.count < 2, @"result count must be 0 or 1");
    if(res.count == 0){
        return(nil);
    }
    return([res objectAtIndex:0]);
}

-(id)first:(NSFetchRequest *)request{
    NSError *error = nil;
    request.fetchLimit = 1;
    NSArray* res = [self executeFetchRequest:request error:&error];
    if(error){
        [[NSException
          exceptionWithName:@"executeFetchRequestError"
          reason:[NSString stringWithFormat:@"%d", (int)error.code]
          userInfo:[NSDictionary dictionaryWithObject:error forKey:@"error"]]
         raise];
        
        return(nil);
    }
    if(res.count == 0){
        return(nil);
    }
    
    return([res objectAtIndex:0]);
}

-(NSArray*)fetch:(NSString*)entityName where:(NSString*)format, ...{
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    if(format){
        va_list args;
        va_start(args, format);
        NSPredicate *pred = [NSPredicate predicateWithFormat:format arguments:args];
        va_end(args);
        
        [request setPredicate:pred];
    }
    
    NSError* error = nil;
    NSArray* result = [self executeFetchRequest:request error:&error];
    
    if(!result){
        [[NSException
          exceptionWithName:@"executeFetchRequestError"
          reason:[NSString stringWithFormat:@"%d", (int)error.code]
          userInfo:[NSDictionary dictionaryWithObject:error forKey:@"error"]]
         raise];
        return nil;
    }
    
    return result;
}

-(NSUInteger)count:(NSString*)entityName where:(NSString*)format, ...
{
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    if(format){
        va_list args;
        va_start(args, format);
        NSPredicate *pred = [NSPredicate predicateWithFormat:format arguments:args];
        va_end(args);
        
        [request setPredicate:pred];
    }
    
    NSError* error = nil;
    NSUInteger count = [self countForFetchRequest:request error:&error];
    
    if(count == NSNotFound){
        [[NSException
          exceptionWithName:@"executeFetchRequestError"
          reason:[NSString stringWithFormat:@"%d", (int)error.code]
          userInfo:[NSDictionary dictionaryWithObject:error forKey:@"error"]]
         raise];
        return 0;
    }
    
    return count;
    
}



-(NSArray*)fetch:(NSString*)entityName{
    return [self fetch:entityName where:nil];
}

-(id)single:(NSString *)entityName where:(NSString *)format, ...{
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    if(format){
        va_list args;
        va_start(args, format);
        NSPredicate *pred = [NSPredicate predicateWithFormat:format arguments:args];
        va_end(args);
        
        [request setPredicate:pred];
    }
    return [self single:request];
}
-(id)first:(NSString *)entityName where:(NSString *)format, ...{
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    if(format){
        va_list args;
        va_start(args, format);
        NSPredicate *pred = [NSPredicate predicateWithFormat:format arguments:args];
        va_end(args);
        
        [request setPredicate:pred];
    }
    return [self first:request];
}

-(id)createObject:(NSString *)entityName{
    NSEntityDescription* entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:self];
    return [[NSManagedObject alloc]initWithEntity:entity insertIntoManagedObjectContext:self];
}

@end
