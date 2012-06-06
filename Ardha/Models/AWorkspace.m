//
//  AWorkspace.m
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "AWorkspace.h"
#import "AUser.h"

@implementation AWorkspace {
    @private
        __strong __block NSDictionary *_users;
}

@synthesize name=_name,
            users=_users;

#pragma mark - Workspace creation
- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super initWithAttributes:attributes];
    if (!self)
        return nil;
    
    _name = [attributes objectForKey:kAsanaAPINameField];
    
    NSString *workspaceUsersURL = [NSString stringWithFormat:@"workspaces/%@/users", [self identifier]];
    
    [AUser usersFromURL:workspaceUsersURL withBlock:^(NSDictionary *users) {
        _users = users;
    }];

    return self;
}

+ (void)workspaceWithID:(NSString *)workspaceID withBlock:(void (^)(AWorkspace *))block
{
    NSString *workspaceURL = [NSString stringWithFormat:@"workspaces/%@", workspaceID];
    [self objectFromURL:workspaceURL withBlock:block];
}

+ (void)workspacesFromURL:(NSString *)url withBlock:(void (^)(NSDictionary *))block
{
    [self objectsFromURL:url withBlock:block];
}

#pragma mark - Workspace modification
- (void)renameWorkspaceTo:(NSString *)newName
{
    NSString *workspaceURL = [NSString stringWithFormat:@"workspaces/%@", [self identifier]];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:newName, kAsanaAPINameField,
                                nil];

    [self changeParameters:parameters atURL:workspaceURL withBlock:^(AWorkspace* workspace) {
        if (workspace) {
            _name = [workspace name];
            NSLog(@"Changed name to %@", [self name]);
        }
    }];
}

#pragma mark - Workspace information

@end
