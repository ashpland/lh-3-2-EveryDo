//
//  Todo.m
//  EveryDo
//
//  Created by Andrew on 2017-10-17.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)init
{
    self = [super init];
    if (self) {
        _todoPriority = Low;
        _isCompleted = NO;
    }
    return self;
}


-(NSString *)checkbox
{
    if (self.isCompleted)
        return @"☑︎";
    else
        return @"☐";
}

-(NSString *)priorityIcon
{
    switch (self.todoPriority) {
        case Low:
            return @"";
        case Medium:
            return @"❗️";
        case High:
            return @"‼️";
    }
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@%@ - %@", self.checkbox, self.priorityIcon, self.title, self.todoDescription];
}

-(void)changeStatus
{
    self.isCompleted = !self.isCompleted;
}


@end
