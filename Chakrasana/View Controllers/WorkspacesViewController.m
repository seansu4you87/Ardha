//
//  WorkspacesViewController.m
//  Chakrasana
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "WorkspacesViewController.h"
#import "ProjectsViewController.h"

#import "Ardha.h"

@interface WorkspacesViewController ()

@end

@implementation WorkspacesViewController {
    @private
        __strong __block AUser *_me;
        __strong __block NSDictionary *_workspaces;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [AUser meWithBlock:^(AUser *me) {
        _me = me;
        [self setTitle:[_me name]];
        [[self tableView] reloadData];
    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_me workspaces] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSArray *keyArray = [[_me workspaces] allKeys];
    AWorkspace *workspace = [[_me workspaces] objectForKey:[keyArray objectAtIndex:indexPath.row]];
    
    [[cell textLabel] setText:[workspace name]];
    
    return cell;
}

#pragma mark - Segue handling
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSArray *keyArray = [[_me workspaces] allKeys];
    
    AWorkspace *selectedWorkspace = [[_me workspaces] objectForKey:[keyArray objectAtIndex:[[self tableView] indexPathForSelectedRow].row]];
    
    [(ProjectsViewController *)[segue destinationViewController] setWorkspace:selectedWorkspace];
}

@end
