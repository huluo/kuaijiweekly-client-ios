//
//  HLTestDetails.h
//  huluo
//
//  Created by Terry on 5/22/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLTestObject.h"



@protocol TestDetailsDelegate <NSObject>

@optional
- (void)chooseBtnClick:(UIButton *)button;

@end

@interface HLTestDetails : UIView
+ (id)testDetails:(HLTestObject *)testObject;
@property (nonatomic, weak) id<TestDetailsDelegate> delegate;

@end
