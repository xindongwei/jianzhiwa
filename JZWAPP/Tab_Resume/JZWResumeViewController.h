//
//  JZWResumeViewController.h
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/2.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "UIView+AutoLayout.h"
@interface JZWResumeViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIView *headerView;

@end
