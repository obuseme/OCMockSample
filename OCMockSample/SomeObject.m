//
//  SomeObject.m
//  OCMockSample
//
//  Created by Andy Obusek on 2/3/14.
//  Copyright (c) 2014 Andy Obusek. All rights reserved.
//

#import "SomeObject.h"

@implementation SomeObject
- (void)aPublicMethod
{
    //do something public
}

//Notice this method is missing from the header file
- (void)aPrivateMethod
{
    //do something private
}
@end