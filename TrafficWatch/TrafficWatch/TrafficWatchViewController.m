//
//  TrafficWatchViewController.m
//  TrafficWatch
//
//  Created by Saksham Gautam on 6/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TrafficWatchViewController.h"
#import "TrafficWatchAppDelegate.h"
#import "TWIncident.h"

@implementation TrafficWatchViewController
@synthesize tableView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void) dealloc;
{
    self.tableView = nil;
}

-(NSInteger) tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger) section;
{
    TrafficWatchAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    return [appDelegate countOfIncidents];
}

-(UITableViewCell *) tableView:(UITableView *)aTableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:MyIdentifier];
    }
    
    TrafficWatchAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    TWIncident *anIncident = [appDelegate objectInIncidentsAtIndex:[indexPath row]]; 
    cell.textLabel.text = anIncident.title;
    cell.detailTextLabel.text = anIncident.summary;
    
    return cell;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
