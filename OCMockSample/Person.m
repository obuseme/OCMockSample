//
//  Person.m
//  OCMockSample
//
//  Created by Andy Obusek on 2/2/14.
//  Copyright (c) 2014 Andy Obusek. All rights reserved.
//

#import "Person.h"

@interface Person()

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *suffix;

@end

@implementation Person

- (NSString *)getFullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (void) doSomethingElseWithTheName
{
    NSLog(@"I'm just going to log a message");
}

- (NSString *) getProperName
{
    NSString *fullName = [self getFullName];
    //Feel free to uncomment this line to see how tests can fail with the "reject" behavior on the mock object
    //[self doSomethingElseWithTheName];
    return [NSString stringWithFormat:@"%@, %@", fullName, self.suffix];
}

- (NSString *) getProperNameAndDoSomething
{
    NSString *fullName = [self getFullName];
    [self doSomethingElseWithTheName];
    return [NSString stringWithFormat:@"%@, %@", fullName, self.suffix];
}

- (BOOL)isLastNameReallyLong
{
    //We won't actually do anything with this, it's for example only
    NSString *lastNameWithoutWhitespace = [self.lastName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    int length = [self.lastName length];
    if (length > 9) return YES;
    return NO;
}

@end
