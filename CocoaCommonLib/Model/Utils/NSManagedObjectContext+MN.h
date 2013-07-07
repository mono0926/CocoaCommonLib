//
//  NSManagedObjectContext+MN.h
//  cookpad_ios
//
//  Created by mono on 6/5/13.
//  Copyright (c) 2013 mono. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (MN)

-(id)single:(NSFetchRequest*)request;
-(id)first:(NSFetchRequest*)request;

-(NSArray*)fetch:(NSString*)entityName where:(NSString*)format, ...;
-(NSArray*)fetch:(NSString*)entityName;

-(id)single:(NSString*)entityName where:(NSString*)format, ...;
-(id)first:(NSString*)entityName where:(NSString*)format, ...;

-(id)createObject:(NSString*)entityName;

-(NSUInteger)count:(NSString*)entityName where:(NSString*)format, ...;
@end
