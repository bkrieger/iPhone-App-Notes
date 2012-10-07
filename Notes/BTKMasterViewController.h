//
//  BTKMasterViewController.h
//  test
//
//  Created by Brandon Krieger on 10/2/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@class BTKNoteDataController;

@interface BTKMasterViewController : UITableViewController

@property (strong, nonatomic) BTKNoteDataController *dataController;

@property (strong, nonatomic) CLLocationManager *locationManager;

- (CLLocationManager *)getLocationManager;

@property (strong,nonatomic) CLLocation *location;

@property (strong,nonatomic) NSString *locationString;

@end
