//
//  FDSegmentedControl.h
//  FDSegment
//
//  Created by 笑虎 on 13-6-8.
//  Copyright (c) 2013年 王谦. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FDSegmentedControlDelegate;
@interface FDSegmentedControl : UIControl
{
//    NSArray *_items;
//    CGFloat _sgmWidth;//动态计算的segment宽
//    NSInteger _sgmIndex;//当前选中的seg
    CALayer *_sgmLayer;
    BOOL _isOne;//第一次就留在这里吧
}
@property(nonatomic,retain)NSArray *items;
@property(nonatomic,retain)UIFont *font;//字体
@property(nonatomic,strong)UIColor *textColor; //字体颜色
@property(nonatomic,strong)UIColor *secTextColor; //选中字体颜色
@property(nonatomic,strong)UIColor *backgroundColor; //背景颜色
@property(nonatomic,assign)id<FDSegmentedControlDelegate> delegate;
@property BOOL splitStyle;
@property CGFloat sgmWidth;
@property NSInteger sgmIndex;
@property(nonatomic,retain)UIView *segmentView;//view

- (id)initWithItems:(NSArray *)items;
-(void)updateLayerFrame;
-(void)setSelectedIndex:(NSInteger)index animated:(BOOL)animated;
@end

#pragma makr view
@interface FDSegmentedView : UIView
@property(nonatomic,assign)FDSegmentedControl *segment;
- (id)initWithFrame:(CGRect)frame segment:(FDSegmentedControl *)segment;
@end

@protocol FDSegmentedControlDelegate <NSObject>
@optional
-(void)FDSegmentedControlSelectIndex:(NSInteger)index segmentView:(FDSegmentedControl *)segmentView;
@end


