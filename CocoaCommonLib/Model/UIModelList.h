//
//  UIModelList.h
//  cookpad_ios
//
//  Created by mono on 6/8/13.
//  Copyright (c) 2013 mono. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol NSFetchedResultsControllerDelegate;
@class NSFetchRequest;
@class NSManagedObjectContext;

@interface UIModelList : NSObject
- (id)initWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                           request:(NSFetchRequest*)request
                       sectionName:(NSString*)sectionName
                         cacheName:(NSString*)cacheName
                          delegate:(id<NSFetchedResultsControllerDelegate>) delegate;
@property(nonatomic) id< NSFetchedResultsControllerDelegate> delegate;
@property (readonly, nonatomic) NSArray* allEntities;
@property (readonly) NSUInteger numberOfItems;
@property (readonly) NSUInteger numberOfSections;
@property (readonly) NSArray* sections;

-(NSUInteger)numberOfItemsInSection:(NSUInteger)index;
-(id)entityAtIndex:(NSUInteger)index;
-(id)entityAtIndexPath:(NSIndexPath*)indexPath;
@end
