//
//  JZWUserHeaderView.m
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/2.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import "JZWUserHeaderView.h"

@implementation JZWUserHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pic_userbg"]]];
        [self createUI];
    }
    return self;
}
-(void)createUI
{
//    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 135)];
    
    UIImageView *headView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
    [headView setCenter:CGPointMake(self.bounds.size.width/2, 8+35)];
    [self addSubview:headView];
    
    UILabel *nameLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
    [nameLable setBackgroundColor:[UIColor clearColor]];
    [nameLable setCenter:CGPointMake(self.bounds.size.width/2, headView.frame.size.height+18)];
    [nameLable setTextAlignment:NSTextAlignmentCenter];
    [nameLable setText:@"辛栋伟先生"];
    [nameLable setTextColor:[UIColor colorWithRed:0.922 green:0.922 blue:0.941 alpha:1]];
    [nameLable  setFont:[UIFont systemFontOfSize:15]];
    [self addSubview:nameLable];
    
    
    
    UILabel *vertifyLable = [[UILabel alloc]initWithFrame:CGRectMake(self.bounds.size.width - 70, 70+10, 60,20)];
    [vertifyLable setBackgroundColor:[UIColor clearColor]];
    [vertifyLable setText:@"已认证"];
    [vertifyLable setTextColor:[UIColor colorWithRed:0.922 green:0.922 blue:0.941 alpha:1]];
    [vertifyLable  setFont:[UIFont systemFontOfSize:13]];
    [self addSubview:vertifyLable];
    
    
    
    
    
    
     UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, self.bounds.size.width, 33)];
    [bottomView setBackgroundColor:[UIColor colorWithRed:0.094 green:0.051 blue:0.020 alpha:0.9]];
    [self addSubview:bottomView];
    
    UIImage *icockImage = [UIImage imageNamed:@"ico_clock"];
    UIImageView *icockImageView =[[UIImageView alloc]initWithFrame:CGRectMake(12, (33-icockImage.size.height/2)/2, icockImage.size.width/2, icockImage.size.height/2)];
    [icockImageView setImage:icockImage];
    [bottomView addSubview:icockImageView];
    
    UILabel *releaseNum = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, 150, 33)];
    [releaseNum setBackgroundColor:[UIColor clearColor]];
    [releaseNum setText:@"当前还有10条简历信息"];
    [releaseNum setTextColor:[UIColor colorWithRed:0.922 green:0.922 blue:0.941 alpha:1]];
    [releaseNum  setFont:[UIFont systemFontOfSize:14]];
    [bottomView addSubview:releaseNum];
    
    
    
    UILabel *buy = [[UILabel alloc]initWithFrame:CGRectMake(180, 6, 60,20)];
    [buy setBackgroundColor:[UIColor clearColor]];
    [buy setText:@"[购买]"];
    [buy setTextColor:[UIColor colorWithRed:0.596 green:0.416 blue:0.027 alpha:1]];
    [buy  setFont:[UIFont systemFontOfSize:13]];
    [bottomView addSubview:buy];
    
    UILabel *checkInfor = [[UILabel alloc]initWithFrame:CGRectMake(250, 6, 80,20)];
    [checkInfor setBackgroundColor:[UIColor clearColor]];
    [checkInfor setText:@"[账户余额]"];
    [checkInfor setTextColor:[UIColor colorWithRed:0.596 green:0.416 blue:0.027 alpha:1]];
    [checkInfor  setFont:[UIFont systemFontOfSize:13]];
    [bottomView addSubview:checkInfor];
    
}
@end
