//
//  HLMainInterfaceViewController.m
//  AWeekOfAccounting
//
//  Created by Terry on 5/25/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import "HLMainInterfaceViewController.h"
#import "FlipSquaresNavigationController.h"

@interface HLMainInterfaceViewController ()

- (IBAction)popViewController:(id)sender;
@end

@implementation HLMainInterfaceViewController

- (id)initViewController
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self = [[HLMainInterfaceViewController alloc] initWithNibName:@"HLMainInterfaceViewController_iPhone" bundle:nil];
    } else {
        self = [[HLMainInterfaceViewController alloc] initWithNibName:@"HLMainInterfaceViewController_iPad" bundle:nil];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (IBAction)popViewController:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



@end
