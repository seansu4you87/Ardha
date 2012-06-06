//
//  TaskCell.m
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "TaskCell.h"

@implementation TaskCell

@synthesize taskLabel, taskStatusImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCompleted:(BOOL)status
{
    if (status) {
        [[self taskStatusImage] setImage:[UIImage imageNamed:@"done"]];
    } else {
        [[self taskStatusImage] setImage:[UIImage imageNamed:@"not-done"]];
    }
}

@end
