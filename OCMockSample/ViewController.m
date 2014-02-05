//
//  ViewController.m
//  OCMockSample
//
//  Created by Andy Obusek on 1/30/14.
//  Copyright (c) 2014 Andy Obusek. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)launchURL:(NSURL *)urlToOpen
{
    [[UIApplication sharedApplication] openURL:urlToOpen];
}

@end
