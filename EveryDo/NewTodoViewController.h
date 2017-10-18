//
//  NewTodoViewController.h
//  EveryDo
//
//  Created by Andrew on 2017-10-17.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewTodoViewController;

@protocol NewTodoViewControllerDelegate

-(void)createNewTodoWithTitle:(NSString *)title andDescription:(NSString *)todoDescription andPriority:(NSInteger)priority;

@end



@interface NewTodoViewController : UIViewController

@property (nonatomic, weak) id<NewTodoViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *priorityPicker;


@end
