//
//  TestModelManager.m
//  cookpad_ios
//
//  Created by mono on 6/5/13.
//  Copyright (c) 2013 mono. All rights reserved.
//

#import "MNTestUtil.h"
#import <CoreData/CoreData.h>
#import "MNCommonModel.h"

@interface ModelManager (Private)
@property (nonatomic) NSManagedObjectModel* managedObjectModel;
@property (nonatomic) NSPersistentStoreCoordinator* coordinator;
@property (nonatomic) NSManagedObjectContext* managedObjectContext;
@end

@implementation MNTestUtil


+(void)initializeModelManagerMock {
    ModelManager* modelManager = inject(ModelManager);
    modelManager.coordinator = [self createPersistentStoreCoordinator];
    modelManager.managedObjectContext = [[NSManagedObjectContext alloc] init];
    modelManager.managedObjectContext.persistentStoreCoordinator = modelManager.coordinator;
}

+(NSPersistentStoreCoordinator*) createPersistentStoreCoordinator {
    ModelManager* modelManager = inject(ModelManager);
    NSPersistentStoreCoordinator* coodinator = [[NSPersistentStoreCoordinator alloc]
                                                initWithManagedObjectModel:modelManager.managedObjectModel];
    NSError* error;
    [coodinator addPersistentStoreWithType:NSInMemoryStoreType
                             configuration:nil
                                       URL:nil
                                   options:nil
                                     error:&error];
    NSAssert(error == nil, nil);
    return coodinator;
}

@end
