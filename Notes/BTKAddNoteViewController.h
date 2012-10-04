//
//  BTKAddNoteViewController.h
//  Notes
//
//  Created by Brandon Krieger on 10/3/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BTKAddNoteViewControllerDelegate;

@interface BTKAddNoteViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) id <BTKAddNoteViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *noteTitleInput;
@property (weak, nonatomic) IBOutlet UITextField *locationInput;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end

@protocol BTKAddNoteViewControllerDelegate <NSObject>
- (void)BTKaddNoteViewControllerDidCancel:(BTKAddNoteViewController *)controller;
- (void)BTKaddNoteViewControllerDidFinish:(BTKAddNoteViewController *)controller title:(NSString *)title location:(NSString *)location;
@end