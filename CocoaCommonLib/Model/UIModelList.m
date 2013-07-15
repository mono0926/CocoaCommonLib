//
//  UIModelList.m
//  cookpad_ios
//
//  Created by mono on 6/8/13.
//  Copyright (c) 2013 mono. All rights reserved.
//

#import "UIModelList.h"
#import "MNCommonModel.h"
@interface UIModelList ()
@property (nonatomic) NSFetchRequest* request;
@property (nonatomic) NSString* sectionName;
@property (nonatomic) NSString* cacheName;
@property (nonatomic) NSFetchedResultsController* fetchedResultsController;
@property (nonatomic) NSManagedObjectContext* managedObjectContext;

@end

@implementation UIModelList

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                           request:(NSFetchRequest*)request
                         sectionName:(NSString*)sectionName
                         cacheName:(NSString*)cacheName
                          delegate:(id<NSFetchedResultsControllerDelegate>) delegate
{
    self = [super init];
    if (self) {
        self.managedObjectContext = managedObjectContext;
        self.request = request;
        self.sectionName = sectionName;
        self.cacheName = cacheName;
        self.delegate = delegate;
    }
    return self;
}

-(NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController) {
#warning なぜか必要
        [_fetchedResultsController performFetch:nil];
        return _fetchedResultsController;
    }
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:self.request
                                                                    managedObjectContext:self.managedObjectContext
                                                                      sectionNameKeyPath:self.sectionName
                                                                               cacheName:self.cacheName];
    _fetchedResultsController.delegate = self.delegate;
    NSError* error;
    BOOL succeeded = [_fetchedResultsController performFetch:&error];
    NSAssert(succeeded, error.description);
    return _fetchedResultsController;
}

-(void)setDelegate:(id<NSFetchedResultsControllerDelegate>)delegate {
    self.fetchedResultsController.delegate = delegate;
}

#pragma mark - for view controller

-(NSUInteger)numberOfItemsInSection:(NSUInteger)index
{
    id<NSFetchedResultsSectionInfo> sectionInfo = self.fetchedResultsController.sections[index];
    return sectionInfo.numberOfObjects;
}

-(NSUInteger)numberOfSections
{
    NSUInteger num = self.fetchedResultsController.sections.count;
    return num;
}

-(NSUInteger)numberOfItems
{
    return self.fetchedResultsController.fetchedObjects.count;
}

-(id)entityAtIndex:(NSUInteger)index
{
    id<CoreDataProtocol> model = [[self.fetchedResultsController fetchedObjects]objectAtIndex:index];
    return model.uiModel;
}

-(id)entityAtIndexPath:(NSIndexPath *)indexPath
{
    id<CoreDataProtocol> model = [self.fetchedResultsController objectAtIndexPath:indexPath];
    return model.uiModel;
}

-(NSArray *)allEntities {
    NSMutableArray* entities = [NSMutableArray new];
    for (id<CoreDataProtocol> model in self.fetchedResultsController.fetchedObjects) {
        [entities addObject:model.uiModel];
    }
    return entities;
}

-(NSArray*)sections {
    return self.fetchedResultsController.sections;
}
@end
