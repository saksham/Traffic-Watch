//
//  TWIncident.h
//  TrafficWatch
//
//  Created by Saksham Gautam on 6/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWIncident : NSObject {
@private
    NSString *title;
    NSString *summary;
    NSString *weblink;
}

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* summary;
@property (nonatomic, copy) NSString* weblink;


- (id)initWithTitle:(NSString *)aTitle
            summary:(NSString *)aSummary
            webLink:(NSString *)aWebLink;
@end
