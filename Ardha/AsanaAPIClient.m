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
static NSString *const kAsanaAPIKey = @"AsanaAPIKey";

+ (AsanaAPIClient *)sharedClient
{
    static AsanaAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AsanaAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kAsanaAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url andAPIKey:(NSString *)apiKey
{
    self = [super initWithBaseURL:url];
    if (!self)
        return nil;
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    [self setParameterEncoding:AFJSONParameterEncoding];
    [self setAuthorizationHeaderWithUsername:apiKey password:[NSString string]];
    
    return self;
}

- (id)initWithBaseURL:(NSURL *)url
{    
    NSString *pathForSettings = [[NSBundle mainBundle] pathForResource:@"Ardha" ofType:@"plist"];
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:pathForSettings];
    
    return [self initWithBaseURL:url andAPIKey:[settings objectForKey:kAsanaAPIKey]];
}

@end
