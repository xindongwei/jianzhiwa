//
//  JZWMemberCenterViewController.m
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/2.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import "JZWMemberCenterViewController.h"
#import "JZWMemberCenterTableviewCell.h"
#import "JZWUserHeaderView.h"
NSString * const kSegueAllDoctorListViewController = @"kSeguehelpViewController";

@implementation JZWMemberCenterViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *headViw= [[[NSBundle mainBundle]loadNibNamed:@"JZWUserHeaderView" owner:nil options:nil] lastObject];

    [_myTableview reloadData];
//    [_myTableview setTableHeaderView:headViw];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 80.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *identify =@"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
//    [cell.textLabel setText:[NSString stringWithFormat:@"dfdfsdfsdfds%ld",indexPath.row]];
//    [cell.textLabel setFont:[UIFont systemFontOfSize:18]];
//    [cell.textLabel setTextColor:[UIColor redColor]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==1) {
        if (indexPath.row==3) {
            self.hidesBottomBarWhenPushed=YES;
            [self performSegueWithIdentifier:kSegueAllDoctorListViewController sender:nil];
            self.hidesBottomBarWhenPushed=NO;
        }
    }
    
    }
#pragma mark - segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}
//标题列表
-(NSArray *)titleList{
    return  [NSArray arrayWithObjects:[NSArray arrayWithObjects:@"申请",@"消息",@"我的收藏",@"系统通知",@"个人简历",@"招聘记录", nil],@[@"小伙伴",@"联系我们",@"骗局接楼",@"更多..."], nil];
    return nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
