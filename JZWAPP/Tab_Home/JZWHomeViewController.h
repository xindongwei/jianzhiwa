//
//  JZWHomeViewController.h
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/2.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface JZWHomeViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableview;

@end
