//
//  Person.h
//  OCMockSample
//
//  Created by Andy Obusek on 2/2/14.
//  Copyright (c) 2014 Andy Obusek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (NSString *)getFullName;
- (NSString *) getProperName;
- (NSString *) getProperNameAndDoSomething;
- (BOOL)isLastNameReallyLong;

@end
