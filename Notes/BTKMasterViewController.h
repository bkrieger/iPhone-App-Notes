//
//  BTKMasterViewController.h
//  test
//
//  Created by Brandon Krieger on 10/2/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BTKNoteDataController;

@interface BTKMasterViewController : UITableViewController

@property (strong, nonatomic) BTKNoteDataController *dataController;
- (IBAction)addNote:(id)sender;

@end
