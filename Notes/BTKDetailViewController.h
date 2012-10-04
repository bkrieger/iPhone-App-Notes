//
//  BTKDetailViewController.h
//  test
//
//  Created by Brandon Krieger on 10/2/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BTKNote;


@interface BTKDetailViewController : UIViewController <UITextFieldDelegate>

@property (strong,nonatomic) BTKNote *note;


@property (weak, nonatomic) IBOutlet UITextField *noteTitleField;
@property (weak, nonatomic) IBOutlet UITextField *noteLocationField;
@property (weak, nonatomic) IBOutlet UITextField *noteDateField;
@property (weak, nonatomic) IBOutlet UITextView *noteTextView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end