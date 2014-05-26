//
//  HLTestObject.m
//  huluo
//
//  Created by Terry on 5/22/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import "HLTestObject.h"

@implementation HLTestObject
+ (instancetype)newTestObject:(NSInteger)testID testContent:(NSString *)testContent testOptionsA:(NSString *)testOptionsA testOptionsB:(NSString *)testOptionsB testOptionsC:(NSString *)testOptionsC testOptionsD:(NSString *)testOptionsD
{
    HLTestObject *testObject = [[HLTestObject alloc] init];
    testObject._testID = testID;
    testObject._testContent = testContent;
    testObject._testOptionsA = testOptionsA;
    testObject._testOptionsB = testOptionsB;
    testObject._testOptionsC = testOptionsC;
    testObject._testOptionsD = testOptionsD;
    
    return testObject;

}
@end
