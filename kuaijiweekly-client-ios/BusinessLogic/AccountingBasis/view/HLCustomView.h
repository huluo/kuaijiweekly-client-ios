//
//  HLCustomView.h
//  huluo
//
//  Created by Terry on 5/21/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HLCustomView;

@protocol CustomDelegate <NSObject>

@optional
- (void)Menus:(HLCustomView *)dock didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to;

@end
@interface HLCustomView : UIView
@property (nonatomic, weak) id<CustomDelegate> delegate;

@property (nonatomic, strong)NSArray *data;
@end
