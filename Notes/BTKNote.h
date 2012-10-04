//
//  BTKNote.h
//  Notes
//
//  Created by Brandon Krieger on 10/3/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTKNote : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, copy) NSString *text;

-(id)initWithTitle:(NSString *)title location:(NSString *)location date:(NSDate *)date text:(NSString *) text;

@end
