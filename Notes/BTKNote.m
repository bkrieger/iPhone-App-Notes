//
//  BTKNote.m
//  Notes
//
//  Created by Brandon Krieger on 10/3/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import "BTKNote.h"

@implementation BTKNote

@synthesize title = _title, location = _location, date = _date;

-(id)initWithTitle:(NSString *)title location:(NSString *)location date:(NSDate *)date {
    self = [super init];
    if (self) {
        _title = title;
        _location = location;
        _date = date;
        return self;
    }
    return nil;
}

@end
