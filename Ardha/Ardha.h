//
//  Ardha.h
//  Ardha
//
//  Created by Bogo Giertler on 6/5/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import <Foundation/Foundation.h>

// Ardha models
#import "AsanaAPIClient.h"
#import "AUser.h"
#import "AWorkspace.h"

static NSString *const kAsanaAPIKey = @"AsanaAPIKey";

@interface Ardha : NSObject

+ (Ardha *)sharedArdha;

@end
