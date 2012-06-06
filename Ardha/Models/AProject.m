//
//  AProject.m
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "AProject.h"

@implementation AProject

@synthesize name=_name,
            tasks=_tasks;

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super initWithAttributes:attributes];
    if (!self)
        return nil;
    
    _name = [attributes objectForKey:kAsanaAPINameField];
    
    NSString *projectTasksURL = [NSString stringWithFormat:@"projects/%@/tasks", [self identifier]];
    
    [ATask tasksFromURL:projectTasksURL withBlock:^(NSDictionary *tasks) {
        _tasks = [NSMutableDictionary dictionaryWithDictionary:tasks];
    }];

    return self;
}

+ (void)projectsFromURL:(NSString *)url withBlock:(void (^)(NSDictionary *))block
{
    [self objectsFromURL:url withBlock:block];
}

@end
