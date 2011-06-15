//
//  TWIncidentsParser.h
//  TrafficWatch
//
//  Created by Saksham Gautam on 6/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWIncident.h"

@interface TWIncidentsParser : NSObject<NSXMLParserDelegate> {
@private
    TWIncident *currentIncidentObject;
    NSMutableString *contentOfCurrentIncidentProperty;
}

- (BOOL)parseFileAtURL:(NSURL *)URL 
            parseError:(NSError **)error;
@end
