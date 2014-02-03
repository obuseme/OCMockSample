//
//  SomeObjectTests.m
//  OCMockSample
//
//  Created by Andy Obusek on 2/3/14.
//  Copyright (c) 2014 Andy Obusek. All rights reserved.
//
#import <XCTest/XCTest.h>
#import "SomeObject.h"

// Definition of the category Test on the class SomeObject
@interface SomeObject (Test)

- (void)aPrivateMethod;

@end

@interface SomeObjectTests : XCTestCase
@property (nonatomic, strong) SomeObject *toTest;
@end

@implementation SomeObjectTests

- (void)setUp
{
    [super setUp];
    self.toTest = [[SomeObject alloc] init];
}

- (void)testPrivateMethod
{
    [self.toTest aPrivateMethod];
}   
@end