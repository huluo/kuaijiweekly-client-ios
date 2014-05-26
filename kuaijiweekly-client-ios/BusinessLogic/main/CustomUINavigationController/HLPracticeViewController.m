//
//  HLPracticeViewController.m
//  huluo
//
//  Created by Terry on 5/21/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import "HLPracticeViewController.h"

@interface HLPracticeViewController ()
{
    NSArray *_arrayList;
}
@end

@implementation HLPracticeViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    _arrayList = [[NSArray alloc] initWithObjects:@"随手练习5道",@"第一分类章节",@"第二分类章节",@"第三分类章节",@"第四分类章节", nil];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor=[UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    cell.textLabel.text = _arrayList[indexPath.row];
  
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arrayList count];
}
//设置组数
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 2;
//}

//内容向右移
//- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 10;
//}
@end
