//
//  NewTodoViewController.m
//  EveryDo
//
//  Created by Andrew on 2017-10-17.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "NewTodoViewController.h"

@interface NewTodoViewController ()
- (IBAction)cancelNewTodo:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
- (IBAction)createNewTodo:(UIBarButtonItem *)sender;

@end

@implementation NewTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:NSSelectorFromString(@"textChanged") name:UITextFieldTextDidChangeNotification object:nil];
}


- (void)textChanged
{
    self.doneButton.enabled = [self.titleTextField hasText] ? YES : NO;   
}


- (IBAction)cancelNewTodo:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)createNewTodo:(UIBarButtonItem *)sender {
    if (self.delegate)
        [self.delegate createNewTodoWithTitle:self.titleTextField.text
                         andDescription:self.descriptionTextView.text
                            andPriority:self.priorityPicker.selectedSegmentIndex];
}
@end
