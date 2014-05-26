//
//  HLTestDetails.m
//  huluo
//
//  Created by Terry on 5/22/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import "HLTestDetails.h"

@interface HLTestDetails ()

@property (weak, nonatomic) IBOutlet UILabel *LadelA;
@property (weak, nonatomic) IBOutlet UILabel *LadelB;
@property (weak, nonatomic) IBOutlet UILabel *LadelC;
@property (weak, nonatomic) IBOutlet UILabel *LadelD;

@property (weak, nonatomic) IBOutlet UILabel *LadelMain;

@end
@implementation HLTestDetails

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
    }
    return self;
}
- (IBAction)BtnChoose:(UIButton *)button
{
    
    
    if ([_delegate respondsToSelector:@selector(chooseBtnClick:)]) {
        [_delegate chooseBtnClick:button];
    }

    
    
}

+ (id)testDetails:(HLTestObject *)testObject
{
    HLTestDetails *view = [[NSBundle mainBundle] loadNibNamed:@"HLTestDetails" owner:nil options:nil][0];
    view.LadelMain.text = [NSString stringWithFormat:@"%@%d",testObject._testContent,testObject._testID];
    
    view.LadelA.text = testObject._testOptionsA;
    view.LadelB.text = testObject._testOptionsB;
    view.LadelC.text = testObject._testOptionsC;
    view.LadelD.text = testObject._testOptionsD;
    
    
    return view;
}



@end
