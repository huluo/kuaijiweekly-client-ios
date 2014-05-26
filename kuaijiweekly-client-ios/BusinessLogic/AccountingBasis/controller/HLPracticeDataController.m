//
//  HLPracticeDataViewController.m
//  huluo
//
//  Created by Terry on 5/21/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import "HLPracticeDataController.h"

@interface HLPracticeDataController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_arrayList;
}
@end

@implementation HLPracticeDataController

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
    _arrayList = [[NSArray alloc] initWithObjects:@"随手练习5道",@"第一分类章节",@"第二分类章节",@"第三分类章节",@"第四分类章节", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrayList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor=[UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    //    cell.textLabel.text = _arrayList[indexPath.row];
    cell.textLabel.text = @"练习数据";
    
    return cell;
    
}



@end
