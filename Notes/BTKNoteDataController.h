//
//  BTKNoteDataController.h
//  Notes
//
//  Created by Brandon Krieger on 10/3/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@class BTKNote;

@interface BTKNoteDataController : NSObject <CLLocationManagerDelegate>

@property (nonatomic,copy) NSMutableArray *masterNoteList;

- (NSUInteger)countOfList;
- (BTKNote *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addNote;
- (void)makeNoteObject;
- (void)removeObjectAtIndex:(NSUInteger)theIndex;
@property (strong, nonatomic) CLLocationManager* locationManager;
@property (strong, nonatomic) CLLocation* location;
@property (strong,nonatomic) NSString* locationString;
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations;
@end

