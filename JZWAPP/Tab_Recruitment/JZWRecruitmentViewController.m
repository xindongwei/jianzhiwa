//
//  JZWRecruitmentViewController.m
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/2.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import "JZWRecruitmentViewController.h"
#import "JZWRecruitmentTableViewCell.h"
#import "JZWRecruitmentTableView1Cell.h"
@implementation JZWRecruitmentViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1.0f;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identify =@"JZWRecruitmentTableView1Cell";
    JZWRecruitmentTableView1Cell *cell= [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    if (!cell) {
        cell = [[JZWRecruitmentTableView1Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
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
@end
