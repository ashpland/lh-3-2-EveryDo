//
//  TodoTableViewCell.m
//  EveryDo
//
//  Created by Andrew on 2017-10-17.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "TodoTableViewCell.h"

@interface TodoTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@end


@implementation TodoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setTodo:(Todo *)todo
{
    _todo = todo;
    self.titleLabel.text = todo.title;
    self.descriptionLabel.text = todo.todoDescription;
    self.priorityLabel.text = todo.priorityIcon;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
