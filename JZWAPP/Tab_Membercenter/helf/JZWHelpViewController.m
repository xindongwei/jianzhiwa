//
//  JZWHelpViewController.m
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/17.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import "JZWHelpViewController.h"
#import "JZWHelpModel.h"
#import "JZWHelpCell.h"
#import "JZWHelpTableViewCell.h"
#import "JZWHeaderViewController.h"
@interface JZWHelpViewController ()
{
    NSMutableArray *_dataList;

}
//@property (strong, nonatomic) SubCateViewController *subVc;
@property (strong, nonatomic) NSDictionary *currentCate;
@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;
@property (nonatomic,strong)UIImageView *headView;
@end

@implementation JZWHelpViewController
- (void)viewDidLoad {
    [super viewDidLoad];
//    _displaydDataArray = [[NSMutableArray alloc]initWithCapacity:0];
    self.isOpen = NO;
    _dataList = [NSMutableArray arrayWithObjects:@"打飞机肯德基疯狂世界发卡上",@"飞机肯德基疯狂",@"打飞机肯德基疯狂世界发卡上打飞机肯德基疯狂世界发卡上打飞机肯德基疯狂世界发卡上", nil];
    // Do any additional setup after loading the view, typically from a nib.
    [self.myTableview setTableHeaderView:self.headView];
//    [self performSelector:@selector(changeDataArray:) withObject:nil];

}

-(UIImageView *)headView
{
    _headView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 75)];
    [_headView setImage:[UIImage imageNamed:@"banner_help"]];
    return  _headView;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}
- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"JZWHelpTableViewCell";
    JZWHelpTableViewCell *cell = (JZWHelpTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
    }
    NSString *name = [_dataList objectAtIndex:indexPath.row];
    [cell.title setText:name];
    [cell changeArrowWithUp:([self.selectIndex isEqual:indexPath]?YES:NO)];
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JZWHelpTableViewCell *cell = (JZWHelpTableViewCell *)[self.myTableview cellForRowAtIndexPath:indexPath];
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    [cell changeArrowWithUp:YES];
//    SubCateViewController *subVc = [[SubCateViewController alloc]
//                                    initWithNibName:NSStringFromClass([SubCateViewController class])
//                                    bundle:nil];
//    subVc.Info = @"111111111111111111111111111111111111111111111111111111111111111111111111";
    
//    UIView *contentView  = [[[NSBundle mainBundle] loadNibNamed:@"JZWHelpContentView" owner:self options:nil] objectAtIndex:0];
    JZWHeaderViewController *headerViewController = [[JZWHeaderViewController alloc]initWithNibName:@"JZWHelpContentView" bundle:nil];
    //NSDictionary *cate = [self.cates objectAtIndex:indexPath.row];
    //self.currentCate = cate;
    [headerViewController setContentStr:@"撒点粉东方饭店发撒发发呆士大夫的说法打发打发地方的说法撒旦法的说法地方爱的方式打发撒点粉按说爱的色放撒点粉爱的色放爱的色放啊撒点粉啊撒点粉安师大晒单发顺丰啊撒点粉多少分爱的色放士大夫爱的色放阿道夫啊撒点粉啊撒点粉啊撒点粉撒点粉啊撒点粉啊撒点粉安师大发多少分爱的色放士大夫爱的色放暗示法暗示法安师大发生的发顺丰安师大发生的发撒点粉暗示法大法师大法师发"];
    self.myTableview.scrollEnabled = NO;
    UIFolderTableView *folderTableView = (UIFolderTableView *)tableView;
    [folderTableView openFolderAtIndexPath:indexPath WithContentView:headerViewController.view
                                 openBlock:^(UIView *subClassView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction){
                                     // opening actions
                                     //[self CloseAndOpenACtion:indexPath];
                                 }
                                closeBlock:^(UIView *subClassView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction){
                                    // closing actions
                                    //[self CloseAndOpenACtion:indexPath];
                                    //[cell changeArrowWithUp:NO];
                                }
                           completionBlock:^{
                               // completed actions
                               self.myTableview.scrollEnabled = YES;
                               [cell changeArrowWithUp:NO];
                           }];
}

-(void)CloseAndOpenACtion:(NSIndexPath *)indexPath
{
    if ([indexPath isEqual:self.selectIndex]) {
        self.isOpen = NO;
        [self didSelectCellRowFirstDo:NO nextDo:NO];
        self.selectIndex = nil;
    }
    else
    {
        if (!self.selectIndex) {
            self.selectIndex = indexPath;
            [self didSelectCellRowFirstDo:YES nextDo:NO];
            
        }
        else
        {
            [self didSelectCellRowFirstDo:NO nextDo:YES];
        }
    }
}
- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
    
    JZWHelpTableViewCell *cell = (JZWHelpTableViewCell *)[self.myTableview cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [self.myTableview indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
