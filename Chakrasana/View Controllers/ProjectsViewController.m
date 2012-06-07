//
//  ProjectsViewController.m
//  Chakrasana
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "ProjectsViewController.h"
#import "TasksViewController.h"

@interface ProjectsViewController ()

@end

@implementation ProjectsViewController

@synthesize workspace;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:[[self workspace] name]];
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
    return [[[self workspace] projects] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSArray *keyArray = [[[self workspace] projects] allKeys];
    AProject *project = [[[self workspace] projects] objectForKey:[keyArray objectAtIndex:indexPath.row]];
    
    [[cell textLabel] setText:[project name]];
    
    return cell;
}

#pragma mark - Segue handling
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSArray *keyArray = [[[self workspace] projects] allKeys];
    
    AProject *selectedProject = [[[self workspace] projects] objectForKey:[keyArray objectAtIndex:[[self tableView] indexPathForSelectedRow].row]];
    
    [(TasksViewController *)[segue destinationViewController] setProject:selectedProject];
}

@end
