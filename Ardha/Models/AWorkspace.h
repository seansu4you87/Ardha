//
//  AWorkspace.h
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "AObject.h"

@interface AWorkspace : AObject

@property (readonly) NSString *identifier;
@property (strong) NSString *name;

-(id)initWithAttributes:(NSDictionary *)attributes;

-(void)renameWorkspaceTo:(NSString *)newName;

@end
