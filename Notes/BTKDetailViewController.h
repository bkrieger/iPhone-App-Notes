//
//  BTKDetailViewController.h
//  test
//
//  Created by Brandon Krieger on 10/2/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTKDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
