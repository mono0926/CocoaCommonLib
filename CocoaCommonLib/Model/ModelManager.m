//
//  ModelManager.m
//  cookpad_ios
//
//  Created by mono on 6/4/13.
//  Copyright (c) 2013 mono. All rights reserved.
//
#import "ModelManager.h"
#import "MNCommonModel.h"

@interface ModelManager ()
@property (nonatomic) NSManagedObjectContext* managedObjectContext;
@property (nonatomic) NSManagedObjectModel* managedObjectModel;
@property (nonatomic) NSPersistentStoreCoordinator* coordinator;
@end

@implementation ModelManager

- (id)init
{
    self = [super init];
    if (self) {
        [self _init];
    }
    return self;
}

-(void)_init {
    self.managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    self.coordinator = [self createPersistentStoreCoordinator];
    
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    _managedObjectContext.persistentStoreCoordinator = self.coordinator;
}

-(NSManagedObjectContext *)managedObjectContextChild {
    NSManagedObjectContext* moc = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    moc.parentContext = self.managedObjectContext;
    return moc;
}

-(NSPersistentStoreCoordinator*) createPersistentStoreCoordinator {
    NSString *applicationSupportDirectory = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES)[0];
    
    NSError *error = nil;
    if ( ![[NSFileManager defaultManager] fileExistsAtPath:applicationSupportDirectory
                                               isDirectory:NO] ) {
        if (![[NSFileManager defaultManager]
              createDirectoryAtPath:applicationSupportDirectory
              withIntermediateDirectories:NO
              attributes:nil
              error:&error]) {
            NSAssert(NO, ([NSString stringWithFormat:@"Failed to create App Support directory %@ : %@", applicationSupportDirectory,error]));
            NSLog(@"Error creating application support directory at %@ : %@", applicationSupportDirectory, error);
            NSAssert(nil, nil);
            return nil;
        }
    }
    
    NSURL *storeURL = [NSURL fileURLWithPath:[applicationSupportDirectory stringByAppendingPathComponent: @"CoreModel.sqlite"]];
    
    NSPersistentStoreCoordinator* coord = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_managedObjectModel];
    [coord addPersistentStoreWithType:NSSQLiteStoreType
                               configuration:nil
                                         URL:storeURL
                                     options:nil
                                       error:&error];
    NSAssert(error == nil, nil);
    return coord;
}
@end
