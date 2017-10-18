//
//  MasterViewController.m
//  EveryDo
//
//  Created by Andrew on 2017-10-17.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "TodoManager.h"
#import "TodoTableViewCell.h"
#import "NewTodoViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@property (nonatomic, strong) TodoManager *todoManager;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.todoManager = [TodoManager new];
    
    [self.todoManager addSampleData];
    
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(getNewTodoInput:)];
    self.navigationItem.rightBarButtonItem = addButton;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)getNewTodoInput:(id)sender {
    [self performSegueWithIdentifier:@"newTaskSegue" sender:sender];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *selectedTodo = self.todoManager.todoList[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setTodo:selectedTodo];
    } else if ([[segue identifier] isEqualToString:@"newTaskSegue"]) {
        NewTodoViewController *controller = (NewTodoViewController *)[segue destinationViewController];
        controller.delegate = self;
        NSLog(@"%@", controller.delegate);
    }

}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    return self.objects.count;
    return self.todoManager.todoList.count;
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoTableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    newCell.todo = self.todoManager.todoList[indexPath.row];

    return newCell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(void)createNewTodoWithTitle:(NSString *)title andDescription:(NSString *)todoDescription andPriority:(NSInteger)priority
{
    [self.todoManager addNewTodoWithTitle:title andDescription:todoDescription andPriority:(TodoPriority)priority];
    [self dismissViewControllerAnimated:YES completion:^(){
        [self insertNewObject:nil];
    }];
}

@end
