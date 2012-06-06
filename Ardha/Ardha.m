//
//  Ardha.m
//  Ardha
//
//  Created by Bogo Giertler on 6/5/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "Ardha.h"

@implementation Ardha {
    @private
        __block __strong AUser *_me;
}

@synthesize me=_me;

#pragma mark - Ardha singleton
+ (Ardha *)sharedArdha
{
    static Ardha *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[Ardha alloc] init];
    });
    return _sharedClient;
}

#pragma mark - Ardha instance

- (id)init
{
    self = [super init];

    if (!self)
        return nil;
    
    NSString *pathForSettings = [[NSBundle mainBundle] pathForResource:@"Ardha" ofType:@"plist"];
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:pathForSettings];
        
    [[SVHTTPClient sharedClient] setBasePath:kAsanaAPIURL];
    [[SVHTTPClient sharedClient] setBasicAuthWithUsername:[settings objectForKey:kAsanaAPIKey] password:[NSString string]];
    
    [[SVHTTPClient sharedClient] GET:@"/users/me" parameters:nil completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
        _me = [[AUser alloc] initWithAttributes:[response objectForKey:@"data"]];
    }];
    
    return self;
}

@end
