//
//  AObject.h
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString AAsanaAPIFieldName;

// API fields
extern AAsanaAPIFieldName *const kAsanaAPIDataField;
extern AAsanaAPIFieldName *const kAsanaAPIIDField;
extern AAsanaAPIFieldName *const kAsanaAPIEmailField;
extern AAsanaAPIFieldName *const kAsanaAPINameField;
extern AAsanaAPIFieldName *const kAsanaAPIAssigneeField;
extern AAsanaAPIFieldName *const kAsanaAPIAssigneeStatusField;
extern AAsanaAPIFieldName *const kAsanaAPICreationDateField;
extern AAsanaAPIFieldName *const kAsanaAPIDueDateField;
extern AAsanaAPIFieldName *const kAsanaAPIModificationDateField;
extern AAsanaAPIFieldName *const kAsanaAPICompletionField;
extern AAsanaAPIFieldName *const kAsanaAPIFollowersField;
extern AAsanaAPIFieldName *const kAsanaAPINotesField;
extern AAsanaAPIFieldName *const kAsanaAPIProjectField;
extern AAsanaAPIFieldName *const kAsanaAPIProjectsField;
extern AAsanaAPIFieldName *const kAsanaAPIWorkspaceField;
extern AAsanaAPIFieldName *const kAsanaAPIWorkspacesField;
extern AAsanaAPIFieldName *const kAsanaAPITargetField;
extern AAsanaAPIFieldName *const kAsanaAPICreatedByField;
extern AAsanaAPIFieldName *const kAsanaAPISourceField;
extern AAsanaAPIFieldName *const kAsanaAPITypeField;

// error handling
extern AAsanaAPIFieldName *const kAsanaAPIMessageField;
extern AAsanaAPIFieldName *const kAsanaAPIPhraseField;

@interface AObject : NSObject

@property (readonly) NSString *identifier;

- (id)initWithAttributes:(NSDictionary *)attributes;
+ (void)objectFromURL:(NSString *)url withBlock:(void (^)(id))block;
+ (void)objectsFromURL:(NSString *)url withBlock:(void (^)(NSDictionary *))block;

- (void)changeParameters:(NSDictionary *)parameters atURL:(NSString *)url withBlock:(void (^)(id))block;

@end
