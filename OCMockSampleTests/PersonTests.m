//
//  OCMockSampleTests.m
//  OCMockSampleTests
//
//  Created by Andy Obusek on 1/30/14.
//  Copyright (c) 2014 Andy Obusek. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"
#import <OCMock/OCMock.h>

@interface PersonTests : XCTestCase

@end

@interface Person (Test)

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *suffix;

- (void) doSomethingElseWithTheName;

@end


@implementation PersonTests

- (void)testGetFullName
{
    //Create a Person to Test
    Person *aPersonToTest = [[Person alloc] init];

    //Create two strings for the Person's first and last name
    NSString *firstName = @"George";
    NSString *lastName = @"Bush";

    //Assign the names to the Person
    aPersonToTest.firstName = firstName;
    aPersonToTest.lastName = lastName;

    //Create a NSString that is the expected format of the full name
    NSString *expectedFullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];

    //Assert that getFullName returns the full name in the format we expect
    XCTAssertEqualObjects([aPersonToTest getFullName], expectedFullName, @"Full name should be the first name followed by the last name");
}

- (void)testGetProperNameAndRejectDoSomethingElse
{
    //Create a Person to Test
    Person *aPersonToTest = [[Person alloc] init];

	//Create the partial mock from the instantiated Person
    id mockPersonToTest = [OCMockObject partialMockForObject:aPersonToTest];
    [[[mockPersonToTest stub] andReturn:@"George Bush"] getFullName];
    
    //Fail the test if this method is ever called
    [[mockPersonToTest reject] doSomethingElseWithTheName];

    aPersonToTest.suffix = @"Sr.";

    //Call getProperName on the mock object.
    XCTAssertEqualObjects([mockPersonToTest getProperName], @"George Bush, Sr.",
                                                            @"Proper name should be the first name followed by the last name, and then the suffix");
}

- (void)testGetProperNameAndDoSomething
{
    //Create a Person to Test
    Person *aPersonToTest = [[Person alloc] init];

	//Create the partial mock from the instantiated Person
    id mockPersonToTest = [OCMockObject partialMockForObject:aPersonToTest];
    [[[mockPersonToTest stub] andReturn:@"George Bush"] getFullName];
    
    //Set the expectation that doSomethingElseWithTheName will be called
    [[mockPersonToTest expect] doSomethingElseWithTheName];

    aPersonToTest.suffix = @"Sr.";

    //Call getProperName on the mock object.
    XCTAssertEqualObjects([mockPersonToTest getProperName], @"George Bush, Sr.", @"Proper name should be the first name followed by the last name, and then the suffix");
    
    //Without the call to verify here, the test will pass (even though doSomethingElseWithTheName is not called from getProperName)
    //Feel free to uncomment this line and see the tests fail
//    [mockPersonToTest verify];
}

- (void)testIsLastNameReallyLong
{
    //Create a Person to Test
    Person *aPersonToTest = [[Person alloc] init];

    id mockLastName = [OCMockObject mockForClass:[NSString class]];
    NSUInteger length = 10;
    [[[mockLastName stub] andReturnValue:OCMOCK_VALUE(length)] length];
    
    //Without setting this expectation, this test will fail
    [[mockLastName expect] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    aPersonToTest.lastName = mockLastName;
    XCTAssertTrue([aPersonToTest isLastNameReallyLong], @"Last name of 10 characters should be really long");
}

- (void)testIsLastNameReallyLongWithANiceMock
{
    //Create a Person to Test
    Person *aPersonToTest = [[Person alloc] init];

    id mockLastName = [OCMockObject niceMockForClass:[NSString class]];
    NSUInteger length = 10;
    [[[mockLastName stub] andReturnValue:OCMOCK_VALUE(length)] length];
    
    //By using a nice mock, we don't need to set this expectation
    //[[mockLastName expect] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    aPersonToTest.lastName = mockLastName;
    XCTAssertTrue([aPersonToTest isLastNameReallyLong], @"Last name of 10 characters should be really long");
}

@end
