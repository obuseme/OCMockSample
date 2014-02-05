//
//  ViewControllerTests.m
//  OCMockSample
//
//  Created by Andy Obusek on 2/5/14.
//  Copyright (c) 2014 Andy Obusek. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "ViewController.h"

@interface ViewControllerTests : XCTestCase
@end

@implementation ViewControllerTests

- (void)testOpenUrl
{
    ViewController *toTest = [[ViewController alloc] init];
    
    NSURL *toOpen = [NSURL URLWithString:@"http://www.google.com"];
    
    // Create a partial mock of UIApplication
    id mockApplication = [OCMockObject partialMockForObject:[UIApplication sharedApplication]];

    // Set an expectation that the UIApplication will be told to open the url
    [[mockApplication expect] openURL:toOpen];
    
    [toTest launchURL:toOpen];

    [mockApplication verify];
    [mockApplication stopMocking];
}

@end
