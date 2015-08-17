//
//  JZWHelpCellTableViewCell.h
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/21.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZWHelpTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *image;
- (void)changeArrowWithUp:(BOOL)up;
@end
