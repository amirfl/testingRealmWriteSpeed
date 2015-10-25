//
//  Person.h
//  testingRealm
//
//  Created by Amir Fleminger on 10/24/15.
//  Copyright © 2015 Amir Fleminger-Fleminger Media LLC. All rights reserved.
//

#import <Realm/Realm.h>
#import <Foundation/Foundation.h>

@interface Person : RLMObject
@property NSString             *firstName;
@property NSString             *lastName;

+ (instancetype)createRandomPerson;
@end



