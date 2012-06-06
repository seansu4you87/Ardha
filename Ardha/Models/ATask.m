//
//  ATask.m
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "ATask.h"
#import "AFJSONRequestOperation.h"

@implementation ATask {
    @private
        __strong NSDate *_createdAt;
        __strong NSDate *_completedAt;
        __strong NSDate *_modifiedAt;
}

@synthesize name = _name,
            notes = _notes,
            assignee=_assignee,
            assigneeStatus,
            createdAt=_createdAt,
            completedAt=_completedAt,
            modifiedAt=_modifiedAt,
            completed;

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super initWithAttributes:attributes];
    if (!self)
        return nil;
    
    _name = [attributes objectForKey:kAsanaAPINameField];
    _notes = [attributes objectForKey:kAsanaAPINotesField];
    completed = false;
    
    return self;
}

+ (void)tasksFromURL:(NSString *)tasksURL withBlock:(void (^)(NSDictionary *))block
{
    [self objectsFromURL:tasksURL withBlock:block];
}

- (NSString *)url
{
    return [NSString stringWithFormat:@"tasks/%@", [self identifier]];
}

- (void)switchCompletionWithBlock:(void (^)(void))block
{
    NSString *reversedCompletion = [self completed] ? @"false" : @"true";
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObject:reversedCompletion forKey:kAsanaAPICompletionField];
    NSDictionary *data = [NSDictionary dictionaryWithObject:parameters forKey:kAsanaAPIDataField];
    
    [[AsanaAPIClient sharedClient] putPath:[self url] parameters:data success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self setCompleted:![self completed]];
        block();
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", [operation responseString]);
    }];
}


@end
