//
//  Person.m
//  testingRealm
//
//  Created by Amir Fleminger on 10/24/15.
//  Copyright © 2015 Amir Fleminger-Fleminger Media LLC. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)createRandomPerson{
    Person *person = [[Person alloc] init];
    
    NSArray *firstNames = @[@"John", @"Michael", @"Doug", @"Ruth", @"Ben",@"Bo", @"Daniel", @"Sandra", @"Sherry", @"Linda", @"Bubba", @"Rachel", @"Hillary", @"Bill"];
    
    NSUInteger randomIndex = arc4random() % [firstNames count];
    person.firstName = firstNames[randomIndex];
    
    NSArray *lastNames = @[@"Johns", @"Edwards", @"Goldstein", @"Goldfinger", @"Cohen", @"Doe", @"Pitzpatrick", @"Bush", @"Obama", @"Clinton", @"McGuire", @"Stewart"];
    randomIndex = arc4random() % [lastNames count];
    person.lastName = lastNames[randomIndex];
    
    return person;
}
@end
