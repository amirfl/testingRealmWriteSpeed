//
//  AppDelegate.m
//  testingRealm
//
//  Created by Amir Fleminger on 10/24/15.
//  Copyright © 2015 Amir Fleminger-Fleminger Media LLC. All rights reserved.
//

#import "AppDelegate.h"
#import <Realm/Realm.h>
#import "Person.h"

#define TICK        startTime = [NSDate date]
#define TOCK(msg)   NSLog(@"%@, Time: %f", msg, -[startTime timeIntervalSinceNow])

#define NUMBER_OF_OBJECT_TO_CREATE 1000

@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate
{
    NSDate *startTime;
    RLMRealm *realm;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    realm = [RLMRealm defaultRealm];
    NSLog(@"Path: %@",realm.configuration.path);
    TICK;
    [realm transactionWithBlock:^{
        [realm deleteAllObjects];
    }];
    
    TOCK(@"Deleted all objects");
    
    TICK;
    [self testWritingOneObjectAtATime];
    TOCK(@"One Object at a time");
    
    
    TICK;
    [realm transactionWithBlock:^{
        [realm deleteAllObjects];
    }];
    
    TOCK(@"Deleted all objects");
    
    TICK;
    [self testWritingAllObjectsAtOnce];
    TOCK(@"All objects at once");
    
}

- (void)testWritingOneObjectAtATime{
    NSLog(@"Writing %i people to realm one at a time.", NUMBER_OF_OBJECT_TO_CREATE);
    for (int i = 0; i<NUMBER_OF_OBJECT_TO_CREATE; i++) {
        Person *person = [Person createRandomPerson];
        
        [realm transactionWithBlock:^{
            [realm addObject:person];
        }];
        
    }
}

- (void)testWritingAllObjectsAtOnce{
    NSMutableArray *people = [[NSMutableArray alloc] init];
    
    NSLog(@"Writing %i people to realm all at once.", NUMBER_OF_OBJECT_TO_CREATE);
    for (int i = 0; i<NUMBER_OF_OBJECT_TO_CREATE; i++) {
        Person *person = [Person createRandomPerson];
        [people addObject:person];
    }
    [realm transactionWithBlock:^{
        [realm addObjects:people];
    }];
}
@end
