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
#import "BTKMasterViewController.h"

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

- (void)addNoteWithLocation:(CLLocation *)location {
    
    
    
    if(location) {
        
        CLGeocoder *geocoder = [CLGeocoder new];
        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
            if(!error && placemarks && placemarks.count > 0) {
                CLPlacemark *result = [placemarks objectAtIndex:0];
                self.locationString = [result name];
            } else {
                float latDeg = location.coordinate.latitude;
                NSString *latDirection = latDeg >= 0 ? @"N" : @"S";
                float latD = floorf(abs(latDeg));
                float latM = (latDeg - latD)*60;
                float latS = (latM - floor(latM)) * 60;
                NSString *lat = [NSString stringWithFormat:@"%i°%i'%i\"%@", (int)latD, (int)latM, (int)latS, latDirection];
                
                float lonDeg = location.coordinate.longitude;
                NSString *lonDirection = lonDeg >= 0 ? @"E" : @"W";
                float lonD = floorf(abs(lonDeg));
                float lonM = (lonDeg - lonD)*60;
                float lonS = (lonM - floor(lonM)) * 60;
                NSString *lon = [NSString stringWithFormat:@"%i°%i'%i\"%@", (int)lonD, (int)lonM, (int)lonS, lonDirection];
                
                self.locationString = [NSString stringWithFormat:@"%@ %@", lat, lon];
            }
        }];
    } else {
        self.locationString = @"";
    }
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    
    BTKNote *note = [[BTKNote alloc] initWithTitle:@"" locationString:self.locationString location:location date:[formatter stringFromDate:[NSDate date]] text:@""];
    [self.masterNoteList addObject:note];
    
}


- (void)removeObjectAtIndex:(NSUInteger)theIndex {
    [self.masterNoteList removeObjectAtIndex:theIndex];
}


@end
