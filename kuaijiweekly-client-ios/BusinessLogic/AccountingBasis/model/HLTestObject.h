//
//  HLTestObject.h
//  huluo
//
//  Created by Terry on 5/22/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLTestObject : NSObject

@property (nonatomic, assign)NSInteger *_testID;
@property (nonatomic, copy)NSString *_testContent;
@property (nonatomic, copy)NSString *_testOptionsA;
@property (nonatomic, copy)NSString *_testOptionsB;
@property (nonatomic, copy)NSString *_testOptionsC;
@property (nonatomic, copy)NSString *_testOptionsD;
+ (instancetype)newTestObject:(NSInteger)testID testContent:(NSString *)testContent testOptionsA:(NSString *)testOptionsA testOptionsB:(NSString *)testOptionsB testOptionsC:(NSString *)testOptionsC testOptionsD:(NSString *)testOptionsD;
@end
