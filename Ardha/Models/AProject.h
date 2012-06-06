//
//  AProject.h
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "AObject.h"

#import "AWorkspace.h"
#import "ATask.h"

@interface AProject : AObject

@property (strong) NSString *name;

@property (strong) NSDictionary *tasks;

- (id)initWithAttributes:(NSDictionary *)attributes;
+ (void)projectsFromURL:(NSString *)url withBlock:(void (^)(NSDictionary *))block;

@end
