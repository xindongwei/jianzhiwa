//
//  JZWRecruitmentTableViewCell.h
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/2.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZWRecruitmentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *serviceType;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *corpName;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *education;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet UILabel *wage;
@property (weak, nonatomic) IBOutlet UILabel *releaseTime;

@end
