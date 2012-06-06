//
//  TaskCell.h
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskCell : UITableViewCell

@property (nonatomic) IBOutlet UILabel *taskLabel;
@property (nonatomic) IBOutlet UIImageView *taskStatusImage;

- (void)setCompleted:(BOOL)status;

@end
