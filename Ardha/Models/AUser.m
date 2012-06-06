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
        __strong NSString *_identifier;
        __strong NSString *_email;
        __strong NSString *_name;
        __strong NSDictionary *_workspaces;
}

@synthesize identifier=_identifier,
            email=_email,
            name=_name,
            workspaces=_workspaces;

#pragma mark - User creation

// This needs to be block-ified.
//+ (id)userWithIdentifier:(NSString *)identifier
//{
//    NSString *userURL = [NSString stringWithFormat:@"/user-id/%@", identifier];
//    [[SVHTTPClient sharedClient] GET:userURL parameters:nil completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
//        AUser *user = [self initWithAttributes:[response objectForKey:@"data"]];
//    }];
//}

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self)
        return nil;
    
    _identifier = [[attributes objectForKey:@"id"] stringValue];
    _name = [attributes objectForKey:@"name"];
    _email = [attributes objectForKey:@"email"];

    if ([attributes objectForKey:@"workspaces"]) {
        NSMutableDictionary *newWorkspaces = [NSMutableDictionary dictionary];
        for (NSDictionary* workspaceAttributes in [attributes objectForKey:@"workspaces"]) {
            AWorkspace *workspace = [[AWorkspace alloc] initWithAttributes:workspaceAttributes];
            [newWorkspaces setObject:workspace forKey:[workspace identifier]];
        }
        _workspaces = [NSDictionary dictionaryWithDictionary:newWorkspaces];
    }
    
    return self;
}

@end
