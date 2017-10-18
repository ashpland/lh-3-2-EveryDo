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
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *priorityPicker;

@end

@implementation NewTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self finishUISetup];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:NSSelectorFromString(@"textChanged") name:UITextFieldTextDidChangeNotification object:nil];

}

- (void)finishUISetup
{
    self.descriptionTextView.layer.borderColor = self.titleTextField.layer.borderColor;
    self.descriptionTextView.layer.borderWidth = self.titleTextField.layer.borderWidth;
    self.descriptionTextView.layer.cornerRadius = self.titleTextField.layer.cornerRadius;
}

- (void)textChanged
{
    self.doneButton.enabled = [self.titleTextField hasText] ? YES : NO;   
}


- (IBAction)cancelNewTodo:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)createNewTodo:(UIBarButtonItem *)sender {
    NSString *todoTitle = self.titleTextField.text;
    NSString *todoDescription = self.descriptionTextView.text;
    NSInteger priorityChoice =  self.priorityPicker.selectedSegmentIndex;
    
    NSLog(@"%@ - %@ - %ld", todoTitle, todoDescription, (long)priorityChoice);
    
    
    
}
@end
