//
//  TWIncidentsParser.m
//  TrafficWatch
//
//  Created by Saksham Gautam on 6/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TWIncidentsParser.h"

@interface TWIncidentsParser()
@property (nonatomic, retain) TWIncident *currentIncidentObject;
@property (nonatomic, retain) NSMutableString *contentOfCurrentIncidentProperty;
@end

@implementation TWIncidentsParser
@synthesize currentIncidentObject;
@synthesize contentOfCurrentIncidentProperty;

#pragma mark - object initialization and deallocation

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

-(void) dealloc;
{
	self.contentOfCurrentIncidentProperty = nil;
	self.currentIncidentObject = nil;
}

#pragma mark - instance methods

-(void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName 
    attributes:(NSDictionary *)attributeDict;
{
    if(qName) {
        elementName = qName;
    }
    
    if([elementName isEqualToString:@"entry"]) {
        // An entry in the RSS feed represents an incident, so create an instance of it. 
        TWIncident *anIncident = [[TWIncident alloc] init]; 
        self.currentIncidentObject = anIncident; 
        return;
    }
    
    if ([elementName isEqualToString:@"link"]) { 
        NSString *relAtt = [attributeDict valueForKey:@"rel"]; 
        if ([relAtt isEqualToString:@"alternate"]) {
            NSString *link = [attributeDict valueForKey:@"href"]; 
            self.currentIncidentObject.weblink = link;
        } 
    } else if ([elementName isEqualToString:@"title"]) {
        // Create a mutable string to hold the contents of the ’title’ element. 
        // The contents are collected in parser:foundCharacters:. 
        self.contentOfCurrentIncidentProperty = [NSMutableString string];
    } else if ([elementName isEqualToString:@"summary"]) { 
        // Create a mutable string to hold the contents of the ’summary’ element. 
        // The contents are collected in parser:foundCharacters:. 
        self.contentOfCurrentIncidentProperty = [NSMutableString string];
    } else {
        // The element isn’t one that we care about, so set the property that holds the
        // character content of the current element to nil. That way, in the parser:foundCharacters:
        // callback, the string that the parser reports will be ignored.
        self.contentOfCurrentIncidentProperty = nil;
    }        
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (self.contentOfCurrentIncidentProperty) {
        // If the current element is one whose content we care about, append 'string'
        // to the property that holds the content of the current element.
        [self.contentOfCurrentIncidentProperty appendString:string];
    }
}

- (BOOL)parseFileAtURL:(NSURL *)URL parseError:(NSError **)error;
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:URL];
    
    [parser setDelegate:self];
    
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
    
    [parser parse];
    NSError *parseError = [parser parserError];
    if (parseError && error) {
        *error = parseError;
        return false;
    }
    return true;
}

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName;
{
    if (qName) {
        elementName = qName;
    }
    
    if ([elementName isEqualToString:@"entry"]) { 
        NSLog(@"parsed: %@", self.currentIncidentObject); 
        return;
    } 
    
    if ([elementName isEqualToString:@"title"]) {
        self.currentIncidentObject.title = self.contentOfCurrentIncidentProperty; 
    } else if ([elementName isEqualToString:@"summary"]) {
        self.currentIncidentObject.summary = self.contentOfCurrentIncidentProperty;
    }
}

@end
