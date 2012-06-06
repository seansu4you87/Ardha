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

#pragma mark - Ardha singleton
+ (Ardha *)sharedArdha
{
    static Ardha *_sharedArdha = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // we specifically init Ardha with a .plist API key since it's a shared instance
        _sharedArdha = [[Ardha alloc] init];
    });
    return _sharedArdha;
}

#pragma mark - Ardha initialization
- (id)initWithAPIKey:(NSString *)apiKey
{
    self = [super init];
    
    if (!self)
        return nil;
    
    [AsanaAPIClient sharedClient];
        
    // set up the root user assigned to the API key
    [AUser meWithBlock:^(AUser *me) {
        if (me) {
            _me = me;
        }
    }];
    
    return self;
}

- (id)init
{
    // obtain the Asana API key from the plist in the app's bundle
    NSString *pathForSettings = [[NSBundle mainBundle] pathForResource:@"Ardha" ofType:@"plist"];
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:pathForSettings];
    
    return [self initWithAPIKey:[settings objectForKey:kAsanaAPIKey]];
}

@end
