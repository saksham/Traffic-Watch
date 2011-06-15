//
//  TWIncident.m
//  TrafficWatch
//
//  Created by Saksham Gautam on 6/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TWIncident.h"

@implementation TWIncident
@synthesize title;
@synthesize summary;
@synthesize weblink;

- (id)initWithTitle:(NSString *)aTitle
            summary:(NSString *)aSummary
            webLink:(NSString *)aWebLink;
{
    self = [super init];
    if (self) {
        self.title = aTitle;
        self.summary = aSummary;
        self.weblink = aWebLink;
    }
    
    return self;
}

-(id) init;
{
    return [self initWithTitle:@"Unknown Incident"
                summary:@"Not available"
                webLink:@"Not available"];
}

-(void) dealloc;
{
    self.title = nil;
    self.weblink = nil;
    self.summary = nil;
}

-(NSString *) description;
{
    NSString *theDescription = [[NSString alloc] 
                                initWithFormat:@"< %@: title = %@, weblink = %@, summary = %@>", NSStringFromClass([self class]), self.title,
                                self.weblink, self.summary];
    return theDescription;
}

@end
