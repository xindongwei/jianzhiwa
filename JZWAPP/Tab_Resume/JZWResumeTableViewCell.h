//
//  JZWResumeTableViewCell.h
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/2.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZWResumeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *sex;
@property (weak, nonatomic) IBOutlet UILabel *height;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet UILabel *colleage;
@property (weak, nonatomic) IBOutlet UILabel *wage;
@property (weak, nonatomic) IBOutlet UILabel *browserTime;
@property (weak, nonatomic) IBOutlet UILabel *workGoal;

@end
