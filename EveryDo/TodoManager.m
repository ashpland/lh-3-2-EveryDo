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
    
//    [self.internalTodoList addObject:newTodo];
    [self.internalTodoList insertObject:newTodo atIndex:0];
}


-(void)changeStatusForTodoAt:(NSUInteger)arrayIndex
{
    [[self.internalTodoList objectAtIndex:arrayIndex] changeStatus];
}

-(void)removeTodoAt:(NSUInteger)arrayIndex
{
    [self.internalTodoList removeObjectAtIndex:arrayIndex];
}


-(void)addSampleData
{
    [self addNewTodoWithTitle:@"A really long title to see what happens when it has a really long title" andDescription:@"But the description is short." andPriority:Low];
    [self addNewTodoWithTitle:@"Repaint Nails" andDescription:@"💅🏽" andPriority:Medium];
    [self addNewTodoWithTitle:@"Really verbose" andDescription:@"Cras facilisis fermentum sapien. Sed eu augue tincidunt magna feugiat dapibus. Pellentesque ultricies dapibus tempor. Etiam maximus, sem eu ullamcorper dapibus, lectus leo dapibus metus, tincidunt tempor nulla ligula vel dolor. Vestibulum lorem odio, auctor sit amet sapien in, blandit varius nisi. Vivamus pretium ligula vel augue faucibus, in scelerisque nibh gravida. Quisque cursus tortor ac dui feugiat, quis dapibus enim volutpat. Nullam vel purus consequat, ullamcorper erat et, vulputate nisi." andPriority:Low];
    [self addNewTodoWithTitle:@"Take out compost" andDescription:@"" andPriority:High];
    [self addNewTodoWithTitle:@"Samhain prep" andDescription:@"💀🔮🎃" andPriority:Low];
    [self addNewTodoWithTitle:@"Figure out layout bug" andDescription:@"It's probably translatesAutoresizingMaskIntoConstraints"  andPriority:Medium];
    [self addNewTodoWithTitle:@"Text Alex" andDescription:@"Send him some cute emojis" andPriority:High];
    [self addNewTodoWithTitle:@"Go to the bank" andDescription:@"Deposit cheques and get some cash" andPriority:Medium];

    self.todoList[1].isCompleted = YES;
    self.todoList[2].isCompleted = YES;
}





@end
