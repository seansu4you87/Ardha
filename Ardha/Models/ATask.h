//
//  ATask.h
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "AObject.h"
#import "AUser.h"
#import "AWorkspace.h"

typedef enum {
    ATaskAssigneeInbox = 0,
    ATaskAssigneeLater = 1,
    ATaskAssigneeToday = 2,
    ATaskAssigneeUpcoming = 3
    } ATaskAssigneeStatus;

@interface ATask : AObject

@property (strong) AUser *assignee;
@property ATaskAssigneeStatus assigneeStatus;

@property (readonly) NSDate *createdAt;
@property (readonly) NSDate *completedAt;
@property (readonly) NSDate *modifiedAt;

@property (readonly) NSDictionary *followers;
@property (readonly) NSDictionary *projects;
@property (readonly) AWorkspace *workspace;

@property (strong) NSString *name;
@property (strong) NSString *notes;

@property Boolean completed;
@property (strong) NSDate *dueOn;

- (id)initWithAttributes:(NSDictionary *)attributes;
+ (void)tasksFromURL:(NSString *)workspaceTasksURL withBlock:(void(^)(NSDictionary *))block;

@end
