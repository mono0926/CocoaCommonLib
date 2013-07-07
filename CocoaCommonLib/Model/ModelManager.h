//
//  ModelManager.h
//  cookpad_ios
//
//  Created by mono on 6/4/13.
//  Copyright (c) 2013 mono. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Syringe/Syringe.h>
@class NSManagedObjectContext;

@interface ModelManager : NSObject<Injectable>

@property (nonatomic, readonly) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, readonly) NSManagedObjectContext* managedObjectContextChild;
@end
