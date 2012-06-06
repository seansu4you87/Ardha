//
//  AProject.h
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "AObject.h"

#import "AWorkspace.h"

@interface AProject : AObject

@property (readonly) NSString *identifier;

@property (strong) NSString *name;
@property (strong) NSString *notes;

@property (readonly) NSDate *createdAt;
@property (readonly) NSDate *completedAt;
@property (readonly) NSDate *modifiedAt;

@property (readonly) NSDictionary *followers;

@property (readonly) AWorkspace *workspace;

@end
