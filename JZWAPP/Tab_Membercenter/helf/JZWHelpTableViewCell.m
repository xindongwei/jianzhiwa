//
//  JZWHelpCellTableViewCell.m
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/21.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import "JZWHelpTableViewCell.h"

@implementation JZWHelpTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)changeArrowWithUp:(BOOL)up
{
    if (up) {
        self.image.image = [UIImage imageNamed:@"arrow_select "];
    }else
    {
        self.image.image = [UIImage imageNamed:@"arrow_nomal"];
    }
}
@end
