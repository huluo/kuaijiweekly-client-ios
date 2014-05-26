//
//  HLBaseViewController.h
//  huluo
//
//  Created by Terry on 5/21/14.
//  Copyright (c) 2014 com.huluo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLCustomView.h"
#import "HLPracticeController.h"
#import "HLWrongTopicController.h"
#import "HLCollectionController.h"
#import "HLPracticeDataController.h"
@interface HLBaseViewController : UIViewController
{
    HLCustomView *_viewww;
    UIView *_navBar;
    HLPracticeController *_practice;
    HLWrongTopicController *_wrongTopic;
    HLCollectionController *_collectioin;
    HLPracticeDataController *_practiceData;
    UIViewController *_gengduo;
}
@end
