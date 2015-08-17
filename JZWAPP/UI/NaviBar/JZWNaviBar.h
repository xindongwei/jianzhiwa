//
//  JZWNaviBar.h
//  JIANZHIWAAPP
//
//  Created by admin on 15/5/24.
//  Copyright (c) 2015年 jianzhiwa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+AutoLayout.h"
@protocol tabNaviBarDelegate;

@interface JZWNaviBar : UIView
@property(nonatomic)id<tabNaviBarDelegate>delegate;
@property(nonatomic)BOOL isSepreate;
@property(nonatomic)BOOL isScroll;
@property(nonatomic)NSInteger selectItem;
-(void)reloadView;
@end
@protocol tabNaviBarDelegate <NSObject>

@required
-(NSInteger)numberOfItems;
-(UIView *)tabView:(NSInteger)itemIndex;
@optional
-(float)itemWith:(NSInteger)itemIndex;
-(void)itemDidSelect:(NSInteger)itemIndex;
-(UIView *)tabSelectView:(NSInteger)itemIndex;
@end
