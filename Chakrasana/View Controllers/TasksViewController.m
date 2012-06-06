//
//  TasksViewController.m
//  Ardha
//
//  Created by Bogo Giertler on 6/6/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "TasksViewController.h"
#import "TaskCell.h"

@interface TasksViewController ()

@end

@implementation TasksViewController

@synthesize project=_project;

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setTitle:[[self project] name]];
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
    return [[[self project] tasks] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TaskCell";
    TaskCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSArray *keyArray = [[[self project] tasks] allKeys];
    ATask *task = [[[self project] tasks] objectForKey:[keyArray objectAtIndex:indexPath.row]];

    [[cell taskLabel] setText:[task name]];
    [cell setCompleted:[task completed]];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *keyArray = [[[self project] tasks] allKeys];
    ATask *task = [[[self project] tasks] objectForKey:[keyArray objectAtIndex:indexPath.row]];

    [task switchCompletionWithBlock:^{
        [(TaskCell *)[tableView cellForRowAtIndexPath:indexPath] setCompleted:[task completed]];
    }];
}

@end
