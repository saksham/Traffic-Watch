//
//  TrafficWatchAppDelegate.h
//  TrafficWatch
//
//  Created by Saksham Gautam on 6/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWIncident.h"

@class TrafficWatchViewController;

@interface TrafficWatchAppDelegate : UIResponder <UIApplicationDelegate> {
    NSMutableArray *incidents;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TrafficWatchViewController *viewController;

-(void) loadIncidentsData;

-(NSUInteger) countOfIncidents;
-(void) addToIncidents:(TWIncident *)newIncident;
-(id) objectInIncidentsAtIndex:(NSUInteger)index;

@end
