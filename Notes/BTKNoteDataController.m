//
//  BTKNoteDataController.m
//  Notes
//
//  Created by Brandon Krieger on 10/3/12.
//  Copyright (c) 2012 Brandon Krieger. All rights reserved.
//

#import "BTKNoteDataController.h"
#import "BTKNote.h"

@interface BTKNoteDataController ()
- (void)initializeDefaultDataList;
@end

@implementation BTKNoteDataController

@synthesize masterNoteList = _masterNoteList;

- (void)initializeDefaultDataList {
    NSMutableArray *noteList = [[NSMutableArray alloc] init];
    self.masterNoteList = noteList;
    //[self addNoteWithTitle:@"New Note" location:@"Unknown"];
}

- (void)setMasterNoteList:(NSMutableArray *)newList {
    if (_masterNoteList != newList) {
        _masterNoteList = [newList mutableCopy];
    }
}

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

- (NSUInteger)countOfList {
    return [self.masterNoteList count];
}

- (BTKNote *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterNoteList objectAtIndex:theIndex];
}

- (void)addNote {
    
    //This is where I will look for a user's location and automatically put it in the location field (where is says Unknown)
    
    BTKNote *note = [[BTKNote alloc] initWithTitle:@"New Note" location:@"Unknown" date:[NSDate date]];
    [self.masterNoteList addObject:note];
}


- (void)addNoteWithTitle:(NSString *)inputNoteTitle location:(NSString *)inputLocation {
    BTKNote *note;
    NSDate *today = [NSDate date];
    note = [[BTKNote alloc] initWithTitle:inputNoteTitle location:inputLocation date:today];
    [self.masterNoteList addObject:note];
}

@end
