//
//  HLPracticeProblemViewController.m
//  huluo
//
//  Created by Terry on 5/22/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import "HLPracticeProblemController.h"
#import "SliderViewController.h"
#import "HLTestObject.h"
#import "HLTestDetails.h"
@interface HLPracticeProblemController ()<TestDetailsDelegate,UIAlertViewDelegate>
{
    HLTestDetails *_testDetails;
    UIButton *_timeBtn;
    NSTimer *_timeee;
    
}
@end
static  int testTime = 0;
static int indexx = 0;
@implementation HLPracticeProblemController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addNavi];
    
    //    [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(updateMusicTimeLabel) userInfo:self repeats:YES];
    
    
    
    
    
}
- (void)setTestObject:(NSArray *)testObject
{
    _testObject = testObject;
    _testDetails= [HLTestDetails testDetails:_testObject[indexx]];
    _testDetails.delegate = self;
    _testDetails.frame = CGRectMake(0, HLNavigationWidth+[UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, self.view.frame.size.height-HLNavigationWidth+[UIApplication sharedApplication].statusBarFrame.size.height);
    [self.view addSubview:_testDetails];
}

- (void)addNavi
{
    UIView *navBar =[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, HLNavigationWidth+[UIApplication sharedApplication].statusBarFrame.size.height)];
    navBar.backgroundColor=[UIColor clearColor];
    navBar.alpha=0.8;
    [self.view addSubview:navBar];
    
    UIButton *returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.frame = CGRectMake(0, 17, HLNavigationWidth, HLNavigationWidth);
    [returnButton setTitle:@"返回" forState:UIControlStateNormal];
    [returnButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    [leftBtn setBackgroundImage:[UIImage imageNamed:@"TestMunu"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(leftItemClick) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:returnButton];
    
    
    UIButton *collection = [UIButton buttonWithType:UIButtonTypeCustom];
    collection.frame = CGRectMake(100, 17, HLNavigationWidth, HLNavigationWidth);
    [collection setTitle:@"收藏" forState:UIControlStateNormal];
    [collection setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    [leftBtn setBackgroundImage:[UIImage imageNamed:@"TestMunu"] forState:UIControlStateNormal];
    collection.tag = 1;
    [collection addTarget:self action:@selector(menusClick:) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:collection];
    
    
    UIButton *progressBar = [UIButton buttonWithType:UIButtonTypeCustom];
    progressBar.frame = CGRectMake(150, 17, HLNavigationWidth, HLNavigationWidth);
    [progressBar setTitle:@"下载" forState:UIControlStateNormal];
    [progressBar setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    [leftBtn setBackgroundImage:[UIImage imageNamed:@"TestMunu"] forState:UIControlStateNormal];
    progressBar.tag = 2;
    [progressBar addTarget:self action:@selector(menusClick:) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:progressBar];
    
    _timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _timeBtn.frame = CGRectMake(200, 17, HLNavigationWidth+50, HLNavigationWidth);
    
    
    
    
    [_timeBtn setTitle:@"00:00" forState:UIControlStateNormal];
    [_timeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    [leftBtn setBackgroundImage:[UIImage imageNamed:@"TestMunu"] forState:UIControlStateNormal];
    _timeBtn.tag = 3;
    [_timeBtn addTarget:self action:@selector(menusClick:) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:_timeBtn];
    
    //     _timeee = [NSTimer timerWithTimeInterval:1.0/60.0 target:self selector:@selector(updateMusicTimeLabel) userInfo:self repeats:YES];
    //
    //    [self StartTimer];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateMusicTimeLabel) userInfo:self repeats:YES];
    
    
}
-(void)updateMusicTimeLabel
{
    testTime++;
    _timeBtn.titleLabel.text = [self intWithDataString:testTime];
    NSLog(@"%@",[self intWithDataString:testTime]);
    
    
}
//NSDate *dates = [NSDate date];
//NSDateFormatter *formatter =  [[NSDateFormatter alloc] init];
//[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/beijing"];
//[formatter setTimeZone:timeZone];
//NSString *loctime = [formatter stringFromDate:dates];
//
- (NSString *)intWithDataString:(int)times
{
    NSString *tmphh = [NSString stringWithFormat:@"%d",times/3600];
    if ([tmphh length] == 1)
    {
        tmphh = [NSString stringWithFormat:@"0%@",tmphh];
    }
    NSString *tmpmm = [NSString stringWithFormat:@"%d",(times/60)%60];
    if ([tmpmm length] == 1)
    {
        tmpmm = [NSString stringWithFormat:@"0%@",tmpmm];
    }
    NSString *tmpss = [NSString stringWithFormat:@"%d",times%60];
    if ([tmpss length] == 1)
    {
        tmpss = [NSString stringWithFormat:@"0%@",tmpss];
    }
    return [NSString stringWithFormat:@"%@:%@",tmpmm,tmpss];
}
-(void)StartTimer
{
    
    [_timeee setFireDate:[NSDate date]];
    
}
//- (void)StopTimer
//{
//    [_timeee setFireDate:[NSDate distantFuture]];
//}

- (void)chooseBtnClick:(UIButton *)button
{
    testTime = 0;
    NSString *msg = @"";
    if (button.tag ==1) {
        msg = @"A";
    }
    if (button.tag ==2) {
        msg = @"B";
    }
    if (button.tag ==3) {
        msg = @"C";
    }
    if (button.tag ==4) {
        msg = @"D";
    }
    
    indexx++;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
    
    
    if (indexx == [_testObject count] -1) {
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"测试完成，是否重新开始练习" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
    
    [_testDetails removeFromSuperview];
    _testDetails= [HLTestDetails testDetails:_testObject[indexx]];
    _testDetails.delegate = self;
    _testDetails.frame = CGRectMake(0, HLNavigationWidth+[UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, self.view.frame.size.height-HLNavigationWidth+[UIApplication sharedApplication].statusBarFrame.size.height);
    [self.view addSubview:_testDetails];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [_testDetails removeFromSuperview];
        
        UIView *view = [[UIView alloc] initWithFrame: _testDetails.frame = CGRectMake(0, HLNavigationWidth+[UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, self.view.frame.size.height-HLNavigationWidth+[UIApplication sharedApplication].statusBarFrame.size.height)];
        for (int i = 0; i<5; i++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(44*i, 200, 44, 44)];
            [button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor  blueColor]];
            [view addSubview:button];
        }
        view.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:view];
        return;
        
    }else
    {
        
        indexx  = 0;
        [_testDetails removeFromSuperview];
        _testDetails= [HLTestDetails testDetails:_testObject[indexx]];
        _testDetails.delegate = self;
        _testDetails.frame = CGRectMake(0, HLNavigationWidth+[UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, self.view.frame.size.height-HLNavigationWidth+[UIApplication sharedApplication].statusBarFrame.size.height);
        [self.view addSubview:_testDetails];
        
    }
    
}
- (void)menusClick:(UIButton *)button
{
    
    
    if (button.tag == 1) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"收藏成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }if (button.tag == 2) {
        
        
        
    }if (button.tag == 3) {
        
    }
    
    
}
-(void)leftItemClick{
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}

@end
