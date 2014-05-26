//
//  HLCustomView.m
//  huluo
//
//  Created by Terry on 5/21/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import "HLCustomView.h"
#import "HLMenusButton.h"
@interface HLCustomView ()
{
    
    HLMenusButton *_selectedButton;
    HLMenusButton *_topOne;
}
@end
@implementation HLCustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];

        UIImageView *logo = [[UIImageView alloc] init];
        logo.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);

        logo.contentMode = UIViewContentModeCenter;
        [self addSubview:logo];

        
        
//        // 4.添加底部的分割线
//        UIImageView *divider = [[UIImageView alloc] init];
//        divider.image = [UIImage imageNamed:@"separator_tabbar_item"];
//        divider.frame = CGRectMake(0, 44 * 5, 44, 2);
//        [self addSubview:divider];
    }
    return self;
}
- (void)setData:(NSArray *)data
{
    _data = data;
    
    for (int i = 0; i < [_data count]; i++) {
         [self addTabButtonWithImage:@"" selectedImage:@"" index:i+1 title:_data[i]];
    }
}

- (void)addTabButtonWithImage:(NSString *)image selectedImage:(NSString *)selectedImage index:(NSUInteger)index title:(NSString *)title
{
    float x = _topOne.frame.origin.x + _topOne.frame.size.width;
    float widths = self.frame.size.width/5;
    if (_topOne == nil) {
        x = 0;
    }
    if (index == 1) {
        widths -= 5;
    }
    if (index == 4) {
        widths += 10;
    }
    // 1.创建按钮
    HLMenusButton *button = [HLMenusButton button];
    
    [button.titleLabel setTextColor:[UIColor blackColor]];
    // 2.设置图片
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    
     button.frame = CGRectMake(x, 0, widths, HLMenuSize);
    
    
    
    
    
    
    // 3.设置尺寸
    [button setTitle:title forState:UIControlStateNormal];
    // 4.监听按下
    [button addTarget:self action:@selector(tabButtonDown:) forControlEvents:UIControlEventTouchDown];
    button.tag = index - 1;
    
    
    [self addSubview:button];
    
    _topOne = button;
    
    // 5.如果是第1个选项卡按钮，就默认按下（选中）
    if (index == 1) {
        [self tabButtonDown:button];
    }
}

- (void)tabButtonDown:(HLMenusButton *)button
{
    // 0.通知代理
    if ([_delegate respondsToSelector:@selector(Menus:didSelectButtonFrom:to:)]) {
        [_delegate Menus:self didSelectButtonFrom:_selectedButton.tag to:button.tag];
    }
    
    // 1.设置按钮的状态
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
}

- (void)setFrame:(CGRect)frame
{
    frame.size.width = 320;
    [super setFrame:frame];
}



@end
