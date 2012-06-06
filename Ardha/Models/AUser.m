//
//  AUser.m
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "AUser.h"
#import "AWorkspace.h"

@implementation AUser {
    @private
        __strong NSString *_email;
        __strong NSString *_name;
        __strong NSDictionary *_workspaces;
}

@synthesize email=_email,
            name=_name,
            workspaces=_workspaces;

#pragma mark - User creation

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super initWithAttributes:attributes];
    if (!self)
        return nil;
    
    _name = [attributes objectForKey:kAsanaAPINameField];
    _email = [attributes objectForKey:kAsanaAPIEmailField];

    if ([attributes objectForKey:kAsanaAPIWorkspacesField]) {
        NSMutableDictionary *newWorkspaces = [NSMutableDictionary dictionary];
        for (NSDictionary* workspaceAttributes in [attributes objectForKey:kAsanaAPIWorkspacesField]) {
            AWorkspace *workspace = [[AWorkspace alloc] initWithAttributes:workspaceAttributes];
            [newWorkspaces setObject:workspace forKey:[workspace identifier]];
        }
        _workspaces = [NSDictionary dictionaryWithDictionary:newWorkspaces];
    }
    
    return self;
}

#pragma mark - User fetching
+ (void)userWithID:(NSString *)userID withBlock:(void (^)(AUser *))block
{
    NSString *userURL = [NSString stringWithFormat:@"users/%@", userID];
    [self objectFromURL:userURL withBlock:block];
}

+ (void)meWithBlock:(void (^)(AUser *))block
{
    [self userWithID:@"me" withBlock:block];
}

+ (void)usersFromURL:(NSString *)url withBlock:(void (^)(NSDictionary *))block
{
    [self objectsFromURL:url withBlock:block];
}

@end
