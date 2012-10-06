//
//  BTKSecondViewController.h
//  Notes
//
//  Created by Brandon Krieger on 10/2/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@class BTKNoteDataController;


@interface BTKSecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *map;

@property (strong, nonatomic) BTKNoteDataController *dataController;


@end
