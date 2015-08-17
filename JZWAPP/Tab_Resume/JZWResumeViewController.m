//
//  JZWResumeViewController.m
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/2.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import "JZWResumeViewController.h"
#import "JZWResumeTableViewCell.h"
#import "JZWResumeTableView1Cell.h"
#import "SCNavTabBar.h"
#import "CommonMacro.h"
#import "JZWNaviBar.h"
NSString * const kSeguepersondetail = @"seguepersondetail";

@interface JZWResumeViewController()<tabNaviBarDelegate>
{
//        SCNavTabBar     *_navTabBar;
    NSInteger       _currentIndex;              // current page index
    JZWNaviBar     *_navTabBar;                 //导航选项卡

}
@end

@implementation JZWResumeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initNaviBar];
}

-(void)initNaviBar
{
    
//    _navTabBar = [[SCNavTabBar alloc] initWithFrame:CGRectMake(DOT_COORDINATE, DOT_COORDINATE, SCREEN_WIDTH, NAV_TAB_BAR_HEIGHT) showArrowButton:NO];
//    _navTabBar.delegate = self;
//    _navTabBar.backgroundColor = [UIColor whiteColor];
//    _navTabBar.lineColor = [UIColor redColor];
//    _navTabBar.itemTitles = @[@"全部",@"全部",@"全部"];
//    _navTabBar.arrowImage = nil;
//    [_navTabBar updateData];
//    [_headerView addSubview:_navTabBar];
    
    _navTabBar = [[JZWNaviBar alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 44)];
    [_navTabBar.layer setBorderWidth:1];
    [_navTabBar.layer setBorderColor:[UIColor colorWithRed:0.969 green:0.969 blue:0.969 alpha:1].CGColor];
    [_navTabBar setIsSepreate:YES];
    [_navTabBar setDelegate:self];
    [_navTabBar setIsScroll:NO];
    [_navTabBar reloadView];
    [_navTabBar setSelectItem:0];
    [_headerView addSubview:_navTabBar];
    
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
    return 106.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identify =@"JZWResumeTableView1Cell";
//    JZWResumeTableViewCell *cell = (JZWResumeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    JZWResumeTableView1Cell *cell= [[[NSBundle mainBundle]loadNibNamed:@"JZWResumeTableView1Cell" owner:nil options:nil] lastObject];
    if (!cell) {
        cell = (JZWResumeTableView1Cell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.hidesBottomBarWhenPushed=YES;
    [self performSegueWithIdentifier:kSeguepersondetail sender:nil];
    self.hidesBottomBarWhenPushed=NO;
    
}


#pragma mark -----tabNaviBarDelegate----
-(NSInteger)numberOfItems{
    return 3;
}
-(UIView *)tabView:(NSInteger)itemIndex
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [label setText:[self.headerArray objectAtIndex:itemIndex]];
    [label setTextColor:[UIColor colorWithRed:0.659 green:0.659 blue:0.659 alpha:1]];
    [label setFont:[UIFont systemFontOfSize:15.0f]];
    [label setTextAlignment:NSTextAlignmentCenter];
    return label;
}
-(float)itemWith:(NSInteger)itemIndex
{
    return 100;
}
-(void)itemDidSelect:(NSInteger)itemIndex
{
    
}
-(UIView *)tabSelectView:(NSInteger)itemIndex{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [label setText:[self.headerArray objectAtIndex:itemIndex]];
    [label setFont:[UIFont systemFontOfSize:15.0f]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor colorWithRed:0.439 green:0.863 blue:0.000 alpha:1]];
    [label setTextAlignment:NSTextAlignmentCenter];
    return label;
}
-(NSArray *)headerArray
{
    return @[@"全部",@"我的附近",@"筛选"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
