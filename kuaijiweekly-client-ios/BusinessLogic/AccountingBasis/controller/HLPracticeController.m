//
//  HLPracticeViewController.m
//  huluo
//
//  Created by Terry on 5/21/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import "HLPracticeController.h"
#import "HLPracticeProblemController.h"
#import "SliderViewController.h"
#import "HLTestObject.h"
@interface HLPracticeController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_arrayList;
    HLPracticeProblemController *_testt;
}
@end

@implementation HLPracticeController



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
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.textLabel.text = _arrayList[indexPath.row];
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arrayList count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *mutable = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        
        HLTestObject *testObject = [HLTestObject newTestObject:i testContent:@"请问XXXX???" testOptionsA:@"AAAA" testOptionsB:@"BBBB" testOptionsC:@"CCCC" testOptionsD:@"DDDD"];
        [mutable addObject:testObject];
    }
    
    
    _testt= [[HLPracticeProblemController alloc] init];
    _testt.testObject = mutable;
    
    //    [self.navigationController presentViewController:_testt animated:YES completion:^{
    //
    //    }];
    
    [self presentViewController:_testt animated:NO completion:^{
        
    }];
    
    //    [self presentViewController:test animated:NO completion:^{
    ////        NSLog(@"跳过去后要处理的业务逻辑");
    //    }];
    
    
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
