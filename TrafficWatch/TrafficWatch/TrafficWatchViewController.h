//
//  TrafficWatchViewController.h
//  TrafficWatch
//
//  Created by Saksham Gautam on 6/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrafficWatchViewController : UIViewController<UITableViewDataSource> {
    UITableView *tableView;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
