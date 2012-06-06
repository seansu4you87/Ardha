//
//  AsanaAPIClient.h
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "AFHTTPClient.h"

@interface AsanaAPIClient : AFHTTPClient

+ (AsanaAPIClient *)sharedClient;
- (id)initWithBaseURL:(NSURL *)url;

@end
