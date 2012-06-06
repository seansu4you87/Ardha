//
//  AsanaAPIClient.m
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "AsanaAPIClient.h"

#import "AFJSONRequestOperation.h"

@implementation AsanaAPIClient

static NSString *const kAsanaAPIBaseURLString = @"https://app.asana.com/api/1.0/";

+ (AsanaAPIClient *)sharedClient
{
    static AsanaAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AsanaAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kAsanaAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url
{
    // TODO: take care of plucking out the key
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];

    NSString *kAsanaAPIKey = @"3aIDXBD.w5GQbgniXAF6Xx1DUWHzrSwe";
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    [self setParameterEncoding:AFJSONParameterEncoding];
    [self setAuthorizationHeaderWithUsername:kAsanaAPIKey password:[NSString string]];
    
    return self;
}

@end
