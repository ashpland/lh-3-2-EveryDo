//
//  TodoManager.h
//  EveryDo
//
//  Created by Andrew on 2017-10-17.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Todo.h"

@interface TodoManager : NSObject

@property (nonatomic, strong, readonly) NSArray<Todo *> *todoList;

- (void)addNewTodoWithTitle:(NSString *)title andDescription:(NSString *)description andPriority:(TodoPriority)priority;
- (void)addSampleData;

-(void)changeStatusForTodoAt:(NSUInteger)arrayIndex;

@end
