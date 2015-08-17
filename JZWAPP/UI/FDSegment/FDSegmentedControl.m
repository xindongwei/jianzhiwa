//
//  FDSegmentedControl.m
//  FDSegment
//
//  Created by 笑虎 on 13-6-8.
//  Copyright (c) 2013年 王谦. All rights reserved.
//

#import "FDSegmentedControl.h"
#import <QuartzCore/QuartzCore.h>

#pragma mark segmentView
@implementation FDSegmentedView
- (id)initWithFrame:(CGRect)frame segment:(FDSegmentedControl *)segment
{
    self = [super initWithFrame:frame];
    if (self) {
        self.segment = segment;
        self.opaque = NO;
    }
    return self;
}

// 绘制界面
- (void)drawRect:(CGRect)rect
{    
    //设置背景
//    [self.segment.backgroundColor setFill];
//    UIRectFill([self bounds]);
    
    //高度
    CGFloat _height = rect.size.height;
    
    //每个seg块的宽度
    self.segment.sgmWidth = rect.size.width / [self.segment.items count];
    
    //绘制字体
    [self.segment.items enumerateObjectsUsingBlock:^(id titleString, NSUInteger idx, BOOL *stop) {
        if (idx == self.segment.sgmIndex) {
            [self.segment.secTextColor set];
        }else{
            [self.segment.textColor set];
        }
        
        CGFloat stringHeight = [titleString sizeWithFont:self.segment.font].height;
        CGFloat y = (_height-stringHeight)/2;
        CGRect r = CGRectMake(self.segment.sgmWidth * idx, y, self.segment.sgmWidth, stringHeight);
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 60000
        [titleString drawInRect:r
                       withFont:self.segment.font
                  lineBreakMode:UILineBreakModeClip
                      alignment:UITextAlignmentCenter];
#else
        [titleString drawInRect:r
                       withFont:self.segment.font
                  lineBreakMode:NSLineBreakByClipping
                      alignment:NSTextAlignmentCenter];
        
#endif
    }];    
}
@end

#pragma makr control

@implementation FDSegmentedControl
@synthesize items = _items;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//初始化
- (id)initWithItems:(NSArray *)items
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.items = items;
        [self setDefault];
    }
    return self;
}

//设置默认
- (void)setDefault
{
    _isOne = YES;
    self.opaque = NO;//允许背景透明
    self.splitStyle = YES;
    self.sgmIndex = 0;
    self.font = [UIFont fontWithName:@"STHeitiSC-Light" size:16.0f];
    self.textColor = [UIColor blackColor];
    self.secTextColor = [UIColor whiteColor];
    self.backgroundColor = [UIColor clearColor];
    
    //创建动画层
    _sgmLayer = [CALayer layer];
    _sgmLayer.backgroundColor = [UIColor redColor].CGColor;
    _sgmLayer.shadowOffset = CGSizeMake(0, 1.0f);
    _sgmLayer.shadowRadius = 5.0f;
    
    //设置边框
    _sgmLayer.borderColor =[UIColor grayColor].CGColor;
    _sgmLayer.borderWidth =0.2;
    _sgmLayer.cornerRadius =5.0;//设置圆角
//    _sgmLayer.opaque = NO;
    [self.layer addSublayer:_sgmLayer];
}

// 绘制
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];//好些是没有什么意义
    
    [self.backgroundColor setFill];
    UIRectFill([self bounds]);
    
    //每个seg块的宽度
    self.sgmWidth = rect.size.width / [self.items count];
    
    self.segmentView = [[FDSegmentedView alloc] initWithFrame:rect segment:self];
    [self addSubview:self.segmentView];
    
    //生成分割线
    if (self.splitStyle) {
        CGFloat _height = rect.size.height;//区域块高度
        CGFloat _split = _height/3;//高度的1/3作为分割符
        
        
        //获得处理的上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        //设置线条样式
        CGContextSetLineCap(context, kCGLineCapSquare);
        
        //设置线条粗细宽度
        CGContextSetLineWidth(context, 1.0f);
        
        //设置颜色
        CGContextSetRGBStrokeColor(context, 224.0f/255.0f, 224.0f/255.0f, 224.0f/255.0f, 224.0f/255.0f);
        for (int i = [self.items count]-1; i>0; i--) {
            //开始一个起始路径
            CGContextBeginPath(context);
            //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
            CGContextMoveToPoint(context, self.sgmWidth*i, _split);
            //设置下一个坐标点,可以设置多个
            CGContextAddLineToPoint(context, self.sgmWidth*i, _height -_split);
            
            //连接上面定义的坐标点
            CGContextStrokePath(context);
        }
    }
    
    //代理调用-初始化时调用接口
    if (_isOne && self.delegate && [self.delegate respondsToSelector:@selector(FDSegmentedControlSelectIndex:segmentView:)]) {
        [self.delegate FDSegmentedControlSelectIndex:self.sgmIndex segmentView:self];
    }
    _isOne = NO;
    [self updateLayerFrame];
}

#pragma mark touch
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    //触摸点是否在seg区域中
    if (CGRectContainsPoint(self.bounds, touchLocation)) {
        NSInteger segment = touchLocation.x / self.sgmWidth;
        
        if (segment != self.sgmIndex) {
            [self setSelectedIndex:segment animated:YES];
        }
    }
}

//选中一个tag
-(void)setSelectedIndex:(NSInteger)index animated:(BOOL)animated
{
    self.sgmIndex = index;
    [self updateLayerFrame];
    [self.segmentView setNeedsDisplay];
    
    //代理调用
    if (self.delegate && [self.delegate respondsToSelector:@selector(FDSegmentedControlSelectIndex:segmentView:)]) {
        [self.delegate FDSegmentedControlSelectIndex:self.sgmIndex segmentView:self];
    }
}

//更新layer层的位置
-(void)updateLayerFrame
{
    _sgmLayer.frame = CGRectMake(3+self.sgmWidth*self.sgmIndex, self.bounds.size.height, self.sgmWidth-6, 3);
}

@end




