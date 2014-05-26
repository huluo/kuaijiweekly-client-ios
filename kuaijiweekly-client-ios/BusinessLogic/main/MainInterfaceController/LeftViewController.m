//
//  LeftViewController.m
//  LeftRightSlider
//
//  Created by Zhao Yiqi on 13-11-27.
//  Copyright (c) 2013年 Zhao Yiqi. All rights reserved.
//

#import "LeftViewController.h"
#import "SliderViewController.h"

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LeftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imgV=[[UIImageView alloc] initWithFrame:self.view.bounds];
    [imgV setImage:[UIImage imageNamed:@"3333"]];
    [self.view addSubview:imgV];
    
    UITableView *tableV=[[UITableView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height-200)];
    tableV.backgroundColor=[UIColor clearColor];
    tableV.delegate=self;
    tableV.dataSource=self;
    [self.view addSubview:tableV];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
   
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor=[UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    switch(indexPath.row){
        case 0:
            cell.textLabel.text=@"会计基础";
            break;
        case 1:
            cell.textLabel.text=@"财经法规";
            break;
        case 2:
            cell.textLabel.text=@"电算化";
            break;

        default:
            break;
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
//            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"MainViewController"];
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"HLAccountingBesicViewController"];
            break;
        case 1:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"HLComputerizationViewController"];
            break;
            
        case 2:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"HLFinancialRegulationsViewController"];
            break;
        default:
            break;
    }
}

@end
