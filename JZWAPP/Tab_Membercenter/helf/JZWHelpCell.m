//
//  JZWHelpCell.m
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/17.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import "JZWHelpCell.h"

@implementation JZWHelpCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)createUI
{
    _title = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, self.bounds.size.width-50, 20)];
    [self addSubview:_title];
    _content=[[UILabel alloc]initWithFrame:CGRectMake(15, 40, self.bounds.size.width-30, 20)];
      [self addSubview:_content];
    UIImage *arrowImage = [UIImage imageNamed:@"arrow_nomal"];
    _imageIcon = [[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width-15-arrowImage.size.width/2, 15, arrowImage.size.width/2, arrowImage.size.height/2)];
     [self addSubview:_imageIcon];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
