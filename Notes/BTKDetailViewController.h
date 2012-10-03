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
@property (weak,nonatomic) IBOutlet UILabel *noteTitleLabel;
@property (weak,nonatomic) IBOutlet UILabel *locationLabel;
@property (weak,nonatomic) IBOutlet UILabel *dateLabel;

@end
