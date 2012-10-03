//
//  BTKDetailViewController.m
//  test
//
//  Created by Brandon Krieger on 10/2/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import "BTKDetailViewController.h"
#import "BTKNote.h"

@interface BTKDetailViewController ()
- (void)configureView;
@end

@implementation BTKDetailViewController

@synthesize note = _note, noteTitleLabel = _noteTitleLabel, locationLabel = _locationLabel, dateLabel = _dateLabel;

#pragma mark - Managing the detail item

/*
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}
*/

- (void)setNote:(BTKNote *) newNote {
    if (_note != newNote) {
        _note = newNote;
        
        //update the view
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    BTKNote *theNote = self.note;
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    
    if(theNote) {
        self.noteTitleLabel.text = theNote.title;
        self.locationLabel.text = theNote.location;
        self.dateLabel.text = [formatter stringFromDate:(NSDate *)theNote.date];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    self.note = nil;
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
