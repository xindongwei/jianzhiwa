//
//  JZWHeaderViewController.m
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/23.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import "JZWHeaderViewController.h"

@interface JZWHeaderViewController ()

@end

@implementation JZWHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _content.numberOfLines = 0;
    CGSize size = [_contentStr sizeWithFont:_content.font constrainedToSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-30, MAXFLOAT)];
    if(size.height < _content.frame.size.height)
    {
        size = CGSizeMake([UIScreen mainScreen].bounds.size.width, _content.frame.size.height);
    }
    [_content setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, size.height)];
    _content.text = _contentStr;

    [self.view setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, size.height)];

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
