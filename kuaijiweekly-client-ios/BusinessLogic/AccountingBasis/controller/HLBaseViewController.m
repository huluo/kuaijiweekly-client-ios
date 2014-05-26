//
//  HLBaseViewController.m
//  huluo
//
//  Created by Terry on 5/21/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import "HLBaseViewController.h"
#import "SliderViewController.h"
#import "HLCustomView.h"
@interface HLBaseViewController ()<CustomDelegate>
{
    
}
@end
@implementation HLBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    _navBar =[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, HLNavigationWidth+[UIApplication sharedApplication].statusBarFrame.size.height)];
    
    _navBar.alpha=0.8;
    [self.view addSubview:_navBar];
    
    
    
    
    
    
    NSArray *arrayMenus = [[NSArray alloc] initWithObjects:@"练习",@"错题本",@"收藏本",@"练习数据",@"更多", nil];
    
    _viewww = [[HLCustomView alloc] initWithFrame:CGRectMake(0, _navBar.frame.size.height, self.view.frame.size.width, HLMenuSize)];
    _viewww.data = arrayMenus;
    _viewww.delegate = self;
    [self.view addSubview:_viewww];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 17, HLNavigationWidth, HLNavigationWidth);
    [leftBtn setTitle:@"" forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"TestMunu"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftItemClick) forControlEvents:UIControlEventTouchUpInside];
    [_navBar addSubview:leftBtn];
    [self addMenusChildVcs];
    
    
}

- (void)addMenusChildVcs
{
    
    _practice = [[HLPracticeController alloc] init];
    [self addChildViewController:_practice];
    
    
    _wrongTopic = [[HLWrongTopicController alloc] init];
    [self addChildViewController:_wrongTopic];
    
    _collectioin = [[HLCollectionController alloc] init];
    [self addChildViewController:_collectioin];
    
    
    _practiceData = [[HLPracticeDataController alloc] init];;
    [self addChildViewController:_practiceData];
    
    _gengduo = [[UIViewController alloc] init];;
    [self addChildViewController:_gengduo];
    
    [self Menus:nil didSelectButtonFrom:0 to:0];
}

//- (void)addOneChildVc:(UIViewController *)vc
//{
//    // 1.包装导航控制器（保证拥有导航条）
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//
//    // 2.添加导航控制器为Main控制器的子控制器
//    [self addChildViewController:nav];
//}
- (void)Menus:(HLCustomView *)dock didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to
{
    // 切换右边显示的控制器
    // 1.移除旧控制器的view
    UIViewController *oldVc = self.childViewControllers[from];
    [oldVc.view removeFromSuperview];
    
    // 2.添加新控制器的view
    UIViewController *newVc = self.childViewControllers[to];
    newVc.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    // 3.宽高中的最大值
    CGFloat newVcH = self.view.frame.size.height - dock.frame.origin.y + dock.frame.size.height;
    CGFloat newVcW = self.view.frame.size.width;
    newVc.view.frame = CGRectMake(0, _viewww.frame.origin.y + _viewww.frame.size.height, newVcW, newVcH);
    [self.view addSubview:newVc.view];
    
    
}

-(void)leftItemClick{
    [[SliderViewController sharedSliderController] leftItemClick];
}
//-(void)rightItemClick{
//    [[SliderViewController sharedSliderController] rightItemClick];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
