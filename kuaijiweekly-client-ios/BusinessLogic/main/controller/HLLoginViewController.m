//
//  HLLoginViewController.m
//  AWeekOfAccounting
//
//  Created by Terry on 5/25/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import "HLLoginViewController.h"
#import "FlipSquaresNavigationController.h"
#import "HLMainInterfaceViewController.h"
#import "SliderViewController.h"
#import "LeftViewController.h"
#import "HLAccountingBesicViewController.h"
@interface HLLoginViewController ()
{
    UITextField *_userName;
    UITextField *_passWord;
}
- (IBAction)pushViewController:(id)sender;

@end

@implementation HLLoginViewController

- (id)initViewController
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self = [[HLLoginViewController alloc] initWithNibName:@"LoginViewController_iPhone" bundle:nil];
    } else {
        self = [[HLLoginViewController alloc] initWithNibName:@"LoginViewController_iPad" bundle:nil];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    _userName = [[UITextField alloc] init];
    _userName.frame = CGRectMake(90, 223, self.view.frame.size.width - 130, 50);
    _userName.placeholder = @"请输入用户名";
    [self.view addSubview:_userName];
    
    _passWord = [[UITextField alloc] init];
    _passWord.frame = CGRectMake(90, 290, self.view.frame.size.width - 130, 50);
    _passWord.placeholder = @"请输入密码";
    _passWord.secureTextEntry = YES;
    [self.view addSubview:_passWord];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
}




- (BOOL)shouldAutorotate
{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (IBAction)pushViewController:(id)sender {
    
    if (_userName.text.length == 0)
    {
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名不能为空" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert1 show];
        return;
    }
    
    if (_passWord.text.length == 0)
    {
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码不能为空" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert1 show];
        return;
    }
    
    [SliderViewController sharedSliderController].mainVCClassName = @"HLAccountingBesicController";
    
    [SliderViewController sharedSliderController].LeftVC=[[LeftViewController alloc] init];
    [SliderViewController sharedSliderController].RightVC=[[HLAccountingBesicViewController alloc] init];
    
    [SliderViewController sharedSliderController].LeftSContentScale=1.0;
    [SliderViewController sharedSliderController].RightSContentScale=1.0;
    
    
    [self.navigationController pushViewController:[SliderViewController sharedSliderController] animated:YES];
    
}

- (void)leftBtnClick:(UIButton *)button
{
    if (button.tag == 1) {
        NSLog(@"会计基础");
    }else if (button.tag == 2)
    {
        NSLog(@"财经法规");
    }else
    {
        NSLog(@"电算化");
    }
}


@end
