//
//  MainViewController.m
//  Chakrasana
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () {
    @private
        __strong __block Ardha *_ardha;
        __strong __block AWorkspace *_workspace;
}

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _ardha = [Ardha sharedArdha];
    
    [AWorkspace workspaceWithID:@"180228403630" withBlock:^(AWorkspace *workspace) {
        _workspace = workspace;
    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Testing methods
- (IBAction)renameWorkspace:(id)sender {
    [_workspace renameWorkspaceTo:@"Personal"];
}

- (IBAction)listUsers:(id)sender {
    [AUser usersFromURL:@"users" withBlock:^(NSDictionary *dictionary) {
        NSLog(@"%@", dictionary);
    }];
}

@end
