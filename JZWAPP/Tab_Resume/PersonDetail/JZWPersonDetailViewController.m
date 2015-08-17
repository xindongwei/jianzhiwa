//
//  JZWPersonDetailViewController.m
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/25.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import "JZWPersonDetailViewController.h"
#import "JZWPersonalHeaderView.h"
#import "JZWPersonDetailTableViewCell.h"
#import "JZWPersonMajorTableViewCell.h"
@interface JZWPersonDetailViewController ()
{
    NSMutableArray *dataSource;
}
@end

@implementation JZWPersonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//      UIView *headViw= [[[NSBundle mainBundle]loadNibNamed:@"JZWPersonalHeaderView" owner:nil options:nil] lastObject];
//    [self.mytableview setTableHeaderView:headViw];
    
}
-(NSMutableArray *)dataSource
{
    dataSource =[NSMutableArray arrayWithArray:@[@{@"title":@"地方金晶科技",@"content":@"地方几口金风科技上岛咖啡讲课费讲课费科技开发就开始风纪扣金风科技饭卡开房间咖啡机卡积分卡东街口打飞机卡机辅导课"},@{@"title":@"地方金晶科技",@"content":@"地方几口金风科技上岛咖啡讲课费讲课费科技开发就开始风纪扣金风科技饭卡开房间咖啡机卡积分卡东街口打飞机卡机辅导课"},@{@"title":@"地方金晶科技",@"content":@"地方几口金风科技上岛咖啡讲课费讲课费科技开发就开始风纪扣金风科技饭卡开房间咖啡机卡积分卡东街口打飞机卡机辅导课"},@{@"title":@"地方金晶科技",@"content":@"地方几口金风科技上岛咖啡讲课费讲课费科技开发就开始风纪扣金风科技饭卡开房间咖啡机卡积分卡东街口打飞机卡机辅导课"},@{@"title":@"地方金晶科技",@"content":@"地方几口金风科技上岛咖啡讲课费讲课费科技开发就开始风纪扣金风科技饭卡开房间咖啡机卡积分卡东街口打飞机卡机辅导课"},@{@"title":@"地方金晶科技",@"content":@"地方几口金风科技上岛咖啡讲课费讲课费科技开发就开始风纪扣金风科技饭卡开房间咖啡机卡积分卡东街口打飞机卡机辅导课地方几口金风科技上岛咖啡讲课费讲课费科技开发就开始风纪扣金风科技饭卡开房间咖啡机卡积分卡东街口打飞机卡机辅导课地方几口金风科技上岛咖啡讲课费讲课费科技开发就开始风纪扣金风科技饭卡开房间咖啡机卡积分卡东街口打飞机卡机辅导课地方几口金风科技上岛咖啡讲课费讲课费科技开发就开始风纪扣金风科技饭卡开房间咖啡机卡积分卡东街口打飞机卡机辅导课地方几口金风科技上岛咖啡讲课费讲课费科技开发就开始风纪扣金风科技饭卡开房间咖啡机卡积分卡东街口打飞机卡机辅导课地方几口金风科技上岛咖啡讲课费讲课费科技开发就开始风纪扣金风科技饭卡开房间咖啡机卡积分卡东街口打飞机卡机辅导课地方几口金风科技上岛咖啡讲课费讲课费科技开发就开始风纪扣金风科技饭卡开房间咖啡机卡积分卡东街口打飞机卡机辅导课地方几口金风科技上岛咖啡讲课费讲课费科技开发就开始风纪扣金风科技饭卡开房间咖啡机卡积分卡东街口打飞机卡机辅导课"},@{@"title":@"地方金晶科技",@"content":@"地方几口金风科技上岛咖啡讲课费讲课费科技开发就开始风纪扣金风科技饭卡开房间咖啡机卡积分卡东街口打飞机卡机辅导课"}]];
    return dataSource;
}

- (CGFloat)getCellHeight:(UITableViewCell*)cell
{
//    [cell layoutIfNeeded];
//    [cell updateConstraintsIfNeeded];
    
    [cell layoutIfNeeded];
    [cell updateConstraintsIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;
}
- (void)loadCellContent:(UITableViewCell*)cell indexPath:(NSIndexPath*)indexPath
{
    //这里把数据设置给Cell
    if (indexPath.row==0) {
        [((JZWPersonMajorTableViewCell *)cell).address  setText:@"辅导费就看见空间看"];
        [((JZWPersonMajorTableViewCell *)cell).infor  setText:@"辅导费就看见空间看东方时代"];
    }
    else {
        [((JZWPersonDetailTableViewCell *)cell).title  setText:[[self.dataSource objectAtIndex:indexPath.row] objectForKey:@"title"]];
        [((JZWPersonDetailTableViewCell *)cell).summery  setText:[[self.dataSource objectAtIndex:indexPath.row] objectForKey:@"content"]];
    }
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //return [[self titles] count] + 1;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return 1;
    NSLog(@"[self.dataSource count]=%lu",(unsigned long)[self.dataSource count]);
    return [self.dataSource count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //log
    
    //只创建一个cell用作测量高度
    UITableViewCell *cell = nil;
    static NSString *identify =@"";
    if (!cell)
    {
        if (indexPath.row ==0) {
            identify =@"kpersonmajor";
//            identify =@"personDetail";
        }
        else{
            identify =@"personDetail";
        }
        cell = [self.mytableview dequeueReusableCellWithIdentifier:identify];
    }
    [self loadCellContent:cell indexPath:indexPath];
    return [self getCellHeight:cell];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *Detailidentify =@"personDetail";
     static NSString *majoridentify =@"kpersonmajor";
    UITableViewCell * cell = nil;
  
    if (indexPath.row == 0) {
        cell =[self.mytableview dequeueReusableCellWithIdentifier:majoridentify ];
    }
    else{
        cell =[self.mytableview dequeueReusableCellWithIdentifier:Detailidentify];
    }
    if (!cell) {
        if (indexPath.row == 0) {
            cell = [[JZWPersonMajorTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:majoridentify];
        }
        else{
           cell = [[JZWPersonDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Detailidentify];
        }
    }
    [self loadCellContent:cell indexPath:indexPath];
    return cell;
 
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
