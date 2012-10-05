//
//  BTKNoteDataController.m
//  Notes
//
//  Created by Brandon Krieger on 10/3/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import "BTKNoteDataController.h"
#import "BTKNote.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLGeocoder.h>

@interface BTKNoteDataController ()
- (void)initializeDefaultDataList;
@end

@implementation BTKNoteDataController

@synthesize masterNoteList = _masterNoteList;

- (void)initializeDefaultDataList {
    NSMutableArray *noteList = [[NSMutableArray alloc] init];
    self.masterNoteList = noteList;
}

- (void)setMasterNoteList:(NSMutableArray *)newList {
    if (_masterNoteList != newList) {
        _masterNoteList = [newList mutableCopy];
    }
}

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

- (NSUInteger)countOfList {
    return [self.masterNoteList count];
}

- (BTKNote *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterNoteList objectAtIndex:theIndex];
}

- (void)addNote {
    
    /*
    if([CLLocationManager locationServicesEnabled]) {
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [locationManager startUpdatingLocation];
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder reverseGeocodeLocation:locationManager.location completionHandler:^(NSArray *placemarks, NSError *error) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            location = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
        
        }];
    } else {
        location = @"";
    }
    */
    location = @"";
    
    //This is where I will look for a user's location and automatically put it in the location field (where it is blank)
    
    BTKNote *note = [[BTKNote alloc] initWithTitle:@"" location:location date:[NSDate date] text:@""];
    [self.masterNoteList addObject:note];
}


- (void)removeObjectAtIndex:(NSUInteger)theIndex {
    [self.masterNoteList removeObjectAtIndex:theIndex];
}


@end
