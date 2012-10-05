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
    
    CLLocation *location = nil;
    NSString *locationString = @"";
    
    if([CLLocationManager locationServicesEnabled]) {
        if([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorized) {
            CLLocationManager *locationManager = [[CLLocationManager alloc] init];
            locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            [locationManager startUpdatingLocation];
            location = locationManager.location;
            
            //If getting the location worked
            if(location) {
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
                
                locationString = [NSString stringWithFormat:@"%@ %@", lat, lon];
            } else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Services" message:@"Unable to find your location." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
            [locationManager stopUpdatingLocation];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Services" message:@"Please allow Notes to use Location Services." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Services" message:@"Please turn location services on." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    
    
    BTKNote *note = [[BTKNote alloc] initWithTitle:@"" locationString:locationString location:location date:[formatter stringFromDate:[NSDate date]] text:@""];
    [self.masterNoteList addObject:note];
}


- (void)removeObjectAtIndex:(NSUInteger)theIndex {
    [self.masterNoteList removeObjectAtIndex:theIndex];
}


@end
