//
//  Ardha.h
//  Ardha
//
//  Created by Bogo Giertler on 6/5/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import <Foundation/Foundation.h>

// Ardha models
#import "AUser.h"
#import "AWorkspace.h"

static NSString *const kAsanaAPIKey = @"AsanaAPIKey";
static NSString *const kAsanaAPIURL = @"https://app.asana.com/api/1.0";

@interface Ardha : NSObject

@property (readonly) AUser *me;

@end
