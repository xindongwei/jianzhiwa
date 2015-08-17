//
//  JZWNaviBar.m
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/24.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import "JZWNaviBar.h"
typedef   enum viewType{
    cellSelect,
    cellNomal
}_viewType;
@interface JZWNaviBar ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tabView;
    struct
    {
        unsigned int numberOfItems :1;
        unsigned int tabView :1;
        unsigned int itemWith :1;
        unsigned int itemDidSelect :1;
        unsigned int tabSelectView :1;
        
    }_delegateFlag;
}
@end

@implementation JZWNaviBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, frame.size.height, frame.size.width)];
        [tabView setDataSource:self];
        [tabView setDelegate:self];
        tabView.showsVerticalScrollIndicator=NO;
        [tabView setCenter:CGPointMake(frame.size.width/2, frame.size.height/2)];
        [tabView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        tabView.transform=CGAffineTransformMakeRotation(-M_PI/2);
        [tabView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:tabView];

    }
    return self;
}
-(void)setDelegate:(id<tabNaviBarDelegate>)delegate
{
    _delegate = delegate;
    _delegateFlag.numberOfItems = [delegate respondsToSelector:@selector(numberOfItems)];
    _delegateFlag.tabView = [delegate respondsToSelector:@selector(tabView:)];
    _delegateFlag.itemWith = [delegate respondsToSelector:@selector(itemWith:)];
    _delegateFlag.itemDidSelect = [delegate respondsToSelector:@selector(itemDidSelect:)];
    _delegateFlag.tabSelectView = [delegate respondsToSelector:@selector(tabSelectView:)];
    
}
-(void)setIsScroll:(BOOL)isScroll{
    _isScroll = isScroll;
    [tabView setScrollEnabled:isScroll];
}
-(void)setSelectItem:(NSInteger)selectItem
{
    _selectItem = selectItem;
    NSIndexPath *ip=[NSIndexPath indexPathForRow:0 inSection:0];
    if (selectItem>=0 ) {
        ip =[NSIndexPath indexPathForRow:selectItem inSection:0];
    }
    [tabView selectRowAtIndexPath:ip animated:YES scrollPosition:UITableViewScrollPositionBottom];
}
#pragma mark -------TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_delegateFlag.numberOfItems) {
        return [_delegate numberOfItems];
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"identify";
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.backgroundView=[self cellView:cellNomal itemRow:indexPath.row];
    cell.selectedBackgroundView =[self cellView:cellSelect itemRow:indexPath.row];
//    if (_delegateFlag.tabView) {
//        UIView *view = [_delegate tabView:indexPath.row];
//        [view setCenter:CGPointMake(self.frame.size.height/2,cell.contentView.bounds.size.height/2)];
//        view.transform=CGAffineTransformMakeRotation(M_PI/2);
//        cell.backgroundView = view;
//    }
    
//        if (_isSepreate) {
//            UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 25, 25)];
//            [line setBackgroundColor:[UIColor redColor]];
//            [cell.backgroundView addSubview:line];
//            [cell.selectedBackgroundView addSubview:line];
//        }
    cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    return cell;
    
    
}
-(UIView *)cellView:(_viewType)select itemRow:(NSInteger)row
{
    float rowHeight =0.0f;
    if (_delegateFlag.itemWith) {
        rowHeight = [_delegate itemWith:row];
    }
    UIView *view = nil;
    switch (select) {
        case cellSelect:
        {
            if (_delegateFlag.tabSelectView) {
            view = [_delegate tabSelectView:row];
            [view setCenter:CGPointMake(self.frame.size.height/2,self.frame.size.height/2)];
        }
            
        }
            break;
        case cellNomal:
        {
            if (_delegateFlag.tabView) {
                view = [_delegate tabView:row];
                [view setCenter:CGPointMake(self.frame.size.height/2,self.frame.size.height/2)];
            }
        }
            break;
        default:
            break;
    }
            if (_isSepreate) {
//                UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(-1 , (44-25)/2, 1, 25)];
//                [line setBackgroundColor:[UIColor colorWithRed:0.871 green:0.871 blue:0.871 alpha:1]];
//                [view addSubview:line];
//                
//                
//                UILabel *line1 = [[UILabel alloc]initWithFrame:CGRectMake(rowHeight-1 , (view.bounds.size.height-25)/2, 1, 25)];
//                [line1 setBackgroundColor:[UIColor colorWithRed:0.871 green:0.871 blue:0.871 alpha:1]];
//                [view addSubview:line1];
                [view.layer setBorderWidth:0.5];
                [view.layer setBorderColor:[UIColor colorWithRed:0.871 green:0.871 blue:0.871 alpha:1].CGColor];
                
          
            }
    if (select==cellSelect) {
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0 , view.bounds.size.height+1, rowHeight,2)];
        [line setBackgroundColor:[UIColor colorWithRed:0.455 green:0.875 blue:0.000 alpha:1]];
        [view addSubview:line];
    }
  
    view.transform=CGAffineTransformMakeRotation(M_PI/2);

    return view;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_delegateFlag.itemDidSelect) {
        [_delegate itemDidSelect:indexPath.row];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_delegateFlag.itemWith) {
        return  [_delegate itemWith:indexPath.row];
    }
    return 0;
}
//重新加载页面
-(void)reloadView{
    [tabView reloadData];
}
@end
