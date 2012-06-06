//
//  AUser.h
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "AObject.h"

@interface AUser : AObject

@property (readonly) NSString* email;
@property (readonly) NSString* name;
@property (readonly) NSDictionary* workspaces;

- (id)initWithAttributes:(NSDictionary *)attributes;

+ (void)userWithID:(NSString *)userID withBlock:(void (^)(AUser *))block;
+ (void)meWithBlock:(void (^)(AUser *))block;
+ (void)usersFromURL:(NSString *)url withBlock:(void (^)(NSDictionary *))block;
@end
