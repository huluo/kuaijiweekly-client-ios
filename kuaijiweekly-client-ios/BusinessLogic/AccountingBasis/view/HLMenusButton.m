//
//  HLMenusButton.m
//  huluo
//
//  Created by Terry on 5/21/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import "HLMenusButton.h"

@implementation HLMenusButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    }
    return self;
}
+ (instancetype)button
{
    return [self buttonWithType:UIButtonTypeCustom];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
