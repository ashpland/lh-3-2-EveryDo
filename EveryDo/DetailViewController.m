//
//  DetailViewController.m
//  EveryDo
//
//  Created by Andrew on 2017-10-17.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;





@end

@implementation DetailViewController

#pragma mark - Managing the detail item


-(void)setTodo:(Todo *)todo {
    if (_todo != todo) {
        _todo = todo;
        
        [self configureView];
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.todo) {
        self.descriptionLabel.text = self.todo.todoDescription;
        self.priorityLabel.text = self.todo.priorityIcon;

        if (self.todo.isCompleted) {
            self.title = [@"✔️ " stringByAppendingString:self.todo.title];
        } else {
            self.title = self.todo.title;
        }
        
        
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
