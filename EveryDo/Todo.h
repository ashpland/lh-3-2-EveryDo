//
//  Todo.h
//  EveryDo
//
//  Created by Andrew on 2017-10-17.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TodoPriority) {
    Low,
    Medium,
    High,
};



@interface Todo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *todoDescription;
@property (nonatomic, assign) TodoPriority todoPriority;
@property (nonatomic, assign) BOOL isCompleted;
@property (nonatomic, strong, readonly) NSString *checkbox;
@property (nonatomic, strong, readonly) NSString *priorityIcon;


@end
