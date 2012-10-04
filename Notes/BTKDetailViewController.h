//
//  BTKDetailViewController.h
//  test
//
//  Created by Brandon Krieger on 10/2/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BTKNote;


@interface BTKDetailViewController : UITableViewController

@property (strong,nonatomic) BTKNote *note;


@property (weak, nonatomic) IBOutlet UITextField *noteTitleField;
- (IBAction)editedNote:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *noteLocationField;
@property (weak, nonatomic) IBOutlet UITextField *noteDateField;

@end