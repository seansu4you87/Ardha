//
//  ATask.m
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "ATask.h"

@implementation ATask {
    @private
        __strong NSDate *_createdAt;
        __strong NSDate *_completedAt;
        __strong NSDate *_modifiedAt;
}

@synthesize assignee=_assignee,
            assigneeStatus,
            createdAt=_createdAt,
            completedAt=_completedAt,
            modifiedAt=_modifiedAt;

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self)
        return nil;
    
    _assignee = [[AUser alloc] initWithAttributes:[attributes objectForKey:kAsanaAPIAssigneeField]];
    
    NSDictionary *assigneeStatusDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithInt:ATaskAssigneeInbox], @"inbox",
                                    [NSNumber numberWithInt:ATaskAssigneeLater], @"later",
                                    [NSNumber numberWithInt:ATaskAssigneeToday], @"today",
                                    [NSNumber numberWithInt:ATaskAssigneeUpcoming], @"upcoming",
                                    nil];
    [self setAssigneeStatus:[[assigneeStatusDictionary objectForKey:[attributes objectForKey:kAsanaAPIAssigneeStatusField]] intValue]];
    
    return self;
}

+ (void)tasksFromURL:(NSString *)workspaceTasksURL withBlock:(void (^)(NSDictionary *))block
{
    [self objectsFromURL:workspaceTasksURL withBlock:block];
}


@end
