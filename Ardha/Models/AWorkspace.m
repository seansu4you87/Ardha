//
//  AWorkspace.m
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "AWorkspace.h"

@implementation AWorkspace {
    @private
        __strong NSString *_identifier;
}

@synthesize identifier=_identifier,
            name=_name;

#pragma mark - Workspace creation
- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self)
        return nil;
    
    _identifier = [[attributes objectForKey:@"id"] stringValue];
    _name = [attributes objectForKey:@"name"];
    
    return self;
}

#pragma mark - Workspace properties
- (NSURL *)url
{
    NSString *workspaceURL = [NSString stringWithFormat:@"/workspaces/%@", [self identifier]];
    return [NSURL URLWithString:workspaceURL];
}

#pragma mark - Workspace modification
- (void)renameWorkspaceTo:(NSString *)newName
{
    NSString *workspaceURL = [[self url] absoluteString];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:newName, @"name",
                                nil];
    [[SVHTTPClient sharedClient] PUT:workspaceURL parameters:parameters completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
        _name = [[response objectForKey:@"data"] objectForKey:@"name"];
    }];
}

@end
