//
//  TodoManager.m
//  EveryDo
//
//  Created by Andrew on 2017-10-17.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "TodoManager.h"


@interface TodoManager ()

@property (nonatomic, strong, readwrite) NSMutableArray<Todo *> *internalTodoList;

@end



@implementation TodoManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalTodoList = [NSMutableArray new];
    }
    return self;
}


-(NSArray<Todo *> *)todoList
{
    return self.internalTodoList;
}


-(void)addNewTodoWithTitle:(NSString *)title andDescription:(NSString *)description andPriority:(TodoPriority)priority
{
    Todo *newTodo = [Todo new];
    newTodo.title = title;
    newTodo.todoDescription = description;
    newTodo.todoPriority = priority;
    
    [self.internalTodoList addObject:newTodo];
}


-(void)addSampleData
{
    [self addNewTodoWithTitle:@"Go to the bank" andDescription:@"Deposit cheques and get some cash" andPriority:Low];
    [self addNewTodoWithTitle:@"Text Alex" andDescription:@"Send him some cute emojis" andPriority:High];
    [self addNewTodoWithTitle:@"Figure out layout bug" andDescription:@"It's probably translatesAutoresizingMaskIntoConstraints"  andPriority:Medium];
    [self addNewTodoWithTitle:@"Samhain prep" andDescription:@"💀🔮🎃" andPriority:Medium];
    [self addNewTodoWithTitle:@"Take out compost" andDescription:@"" andPriority:High];
    self.todoList[1].isCompleted = YES;
}


@end
