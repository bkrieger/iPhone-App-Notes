//
//  BTKNote.h
//  Notes
//
//  Created by Brandon Krieger on 10/3/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface BTKNote : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *locationString;
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, copy) NSString *text;

-(id)initWithTitle:(NSString *)title locationString:(NSString *)locationString location:(CLLocation *) location date:(NSString *)date text:(NSString *) text;

@end
