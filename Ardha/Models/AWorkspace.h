//
//  AWorkspace.h
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "AObject.h"

@interface AWorkspace : AObject

@property (strong) NSString *name;
@property (readonly) NSDictionary *users;
@property (strong) NSMutableDictionary *tasks;
@property (strong) NSMutableDictionary *projects;

- (id)initWithAttributes:(NSDictionary *)attributes;

+ (void)workspaceWithID:(NSString *)workspaceID withBlock:(void (^)(AWorkspace *))block;
+ (void)workspacesFromURL:(NSString *)url withBlock:(void (^)(NSDictionary *))block;

- (void)renameWorkspaceTo:(NSString *)newName;

@end
