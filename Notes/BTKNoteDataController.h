//
//  BTKNoteDataController.h
//  Notes
//
//  Created by Brandon Krieger on 10/3/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BTKNote;

@interface BTKNoteDataController : NSObject

@property (nonatomic,copy) NSMutableArray *masterNoteList;

- (NSUInteger)countOfList;
- (BTKNote *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addNoteWithTitle:(NSString *)inputNoteTitle location:(NSString *)inputLocation;
- (void)removeObjectAtIndex:(NSUInteger)theIndex;
@end
