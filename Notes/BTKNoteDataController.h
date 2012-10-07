//
//  BTKNoteDataController.h
//  Notes
//
//  Created by Brandon Krieger on 10/3/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@class BTKNote;

@interface BTKNoteDataController : NSObject

@property (nonatomic,copy) NSMutableArray *masterNoteList;

@property (nonatomic,copy) NSString *locationString;
- (NSUInteger)countOfList;
- (BTKNote *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addNoteWithLocation:(CLLocation *)location;
- (void)removeObjectAtIndex:(NSUInteger)theIndex;
@end

