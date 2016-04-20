//
//  TriangleView.m
//  FundamentalFigure
//
//  Created by cenon on 16/4/20.
//  Copyright © 2016年 jaway. All rights reserved.
//

#import "TriangleView.h"

@implementation TriangleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画三角形
    CGContextMoveToPoint(ctx, _pointA.x, _pointA.y);
    CGContextAddLineToPoint(ctx, _pointB.x , _pointB.y);
    CGContextAddLineToPoint(ctx, _pointC.x  , _pointC.y);

    // 关闭路径(连接起点和最后一个点)
    CGContextClosePath(ctx);
    
    //
    CGContextSetRGBStrokeColor(ctx, 0, 0, 66.0/255, 1);
    
    // 3.绘制图形
    CGContextStrokePath(ctx);
}


@end
