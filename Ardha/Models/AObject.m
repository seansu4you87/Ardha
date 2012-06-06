//
//  AObject.m
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "AObject.h"

#import "AsanaAPIClient.h"
#import "AFJSONRequestOperation.h"

// API fields
AAsanaAPIFieldName *const kAsanaAPIDataField = @"data";
AAsanaAPIFieldName *const kAsanaAPIIDField = @"id";
AAsanaAPIFieldName *const kAsanaAPIEmailField = @"email";
AAsanaAPIFieldName *const kAsanaAPINameField = @"name";
AAsanaAPIFieldName *const kAsanaAPIAssigneeField = @"assignee";
AAsanaAPIFieldName *const kAsanaAPIAssigneeStatusField = @"assignee_status";
AAsanaAPIFieldName *const kAsanaAPICreationDateField = @"created_at";
AAsanaAPIFieldName *const kAsanaAPIDueDateField = @"due_on";
AAsanaAPIFieldName *const kAsanaAPIModificationDateField = @"modified_at";
AAsanaAPIFieldName *const kAsanaAPICompletionField = @"completed";
AAsanaAPIFieldName *const kAsanaAPIFollowersField = @"followers";
AAsanaAPIFieldName *const kAsanaAPINotesField = @"notes";
AAsanaAPIFieldName *const kAsanaAPIProjectField = @"project";
AAsanaAPIFieldName *const kAsanaAPIProjectsField = @"projects";
AAsanaAPIFieldName *const kAsanaAPIWorkspaceField = @"workspace";
AAsanaAPIFieldName *const kAsanaAPIWorkspacesField = @"workspaces";
AAsanaAPIFieldName *const kAsanaAPITargetField = @"target";
AAsanaAPIFieldName *const kAsanaAPICreatedByField = @"created_by";
AAsanaAPIFieldName *const kAsanaAPISourceField = @"source";
AAsanaAPIFieldName *const kAsanaAPITypeField = @"type";

// error handling
AAsanaAPIFieldName *const kAsanaAPIMessageField = @"message";
AAsanaAPIFieldName *const kAsanaAPIPhraseField = @"phrase";

@implementation AObject {
    @private
        __strong NSString *_identifier;
}

@synthesize identifier=_identifier;

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self)
        return nil;
    
    _identifier = [[attributes objectForKey:kAsanaAPIIDField] stringValue];
    
    return self;
}

+ (void)objectFromURL:(NSString *)url withBlock:(void (^)(id))block
{    
    [[AsanaAPIClient sharedClient] getPath:url parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON) {
        id object = [[self alloc] initWithAttributes:[JSON objectForKey:kAsanaAPIDataField]];
        if (block) {
            block(object);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(nil);
    }];
}

+ (void)objectsFromURL:(NSString *)url withBlock:(void (^)(NSDictionary *))block
{    
    [[AsanaAPIClient sharedClient] getPath:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *objects = [NSMutableDictionary dictionary];
        for (id objectAttributes in [responseObject objectForKey:kAsanaAPIDataField]) {
            id object = [[self alloc] initWithAttributes:objectAttributes];
            [objects setValue:object forKey:[object identifier]];
        }
        if (block) {
            block([NSDictionary dictionaryWithDictionary:objects]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            block(nil);
    }];
}

- (void)changeParameters:(NSDictionary *)parameters atURL:(NSString *)url withBlock:(void (^)(id))block
{
    NSDictionary *data = [NSDictionary dictionaryWithObject:parameters forKey:kAsanaAPIDataField];
    [[AsanaAPIClient sharedClient] putPath:url parameters:data success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id object = [self initWithAttributes:[responseObject objectForKey:kAsanaAPIDataField]];
        block(object);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", [operation responseString]);
        block(nil);
    }];
}

@end
