//
//  BTKSecondViewController.m
//  Notes
//
//  Created by Brandon Krieger on 10/2/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import "BTKSecondViewController.h"
#import "BTKNoteDataController.h"
#import "BTKNote.h"

//@interface BTKSecondViewController ()

//@end

@implementation BTKSecondViewController

@synthesize dataController = _dataController;

- (void)viewDidAppear:(BOOL)animated {
    MKPointAnnotation* annot = [[MKPointAnnotation alloc] init];
    
    double max_lat = 0.0f;
    double max_lon = 0.0f;
    double min_lat = 359.9f;
    double min_lon = 359.9f;
    double sum_lat = 0.0f;
    double sum_lon = 0.0f;
    double numLocations = 0.0f;
    
    for (int i=0; i<[self.dataController countOfList]; i++) {
        BTKNote *note = [self.dataController objectInListAtIndex:i];
        CLLocation *location = note.location;
        if(location!=nil) {
            [annot setCoordinate:location.coordinate];
            [annot setTitle:note.title];
            
            float lat = location.coordinate.latitude;
            float lon = location.coordinate.longitude;
            
            if(lat>max_lat) {
                max_lat = location.coordinate.latitude;
            }
            if(lon>max_lon) {
                max_lon = location.coordinate.longitude;
            }
            if(lat<min_lat) {
                min_lat = location.coordinate.latitude;
            }
            if(lon<min_lon) {
                min_lon = location.coordinate.longitude;
            }
            sum_lat += lat;
            sum_lon += lon;
            
            numLocations++;
            
            [self.map addAnnotation:annot];
        }
    }
    
    if(numLocations>0.0f) {
        double center_lat = sum_lat/numLocations;
        double center_lon = sum_lon/numLocations;
        
        CLLocationCoordinate2D center;
        center.latitude = center_lat;
        center.longitude = center_lon;
        /*
        MKCoordinateSpan span = MKCoordinateSpanMake(abs(max_lat) + abs(min_lat), abs(max_lon) + abs(min_lon));
        MKCoordinateRegion region = {center, span};
    
        
        [self.map setRegion:region];
         */
        [self.map setCenterCoordinate:center];
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end
