//
//  PieChartView.m
//  FundamentalFigure
//
//  Created by cenon on 16/4/20.
//  Copyright © 2016年 jaway. All rights reserved.
//

#import "PieChartView.h"
#import "PieChartcontent.h"
#define PI 3.14159265358979323846
static inline float radians(double degrees) { return degrees * PI / 180; }

@implementation PieChartView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        _contentArray=[[NSArray alloc]init];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    [self PieChartViewWithContentarray:_contentArray];
}


-(void)PieChartViewWithContentarray:(NSArray*)contentarray
{
    if (contentarray==nil||contentarray.count==0) {
        NSLog(@"饼图没有内容");
        return;
    }
    double temp=0;
    for (PieChartcontent *pc in contentarray) {
        temp=temp+pc.degrees;
    }
    if (temp>360.0) {
        NSLog(@"饼图数据错误");
        return;
    }
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    double tt=0;
    for (NSInteger i=0; i<contentarray.count; i++) {
        PieChartcontent *cc=contentarray[i];
        
            [self paintpie:ctx start:tt capacity:cc.degrees pointx:self.bounds.size.width/2 pointy:self.bounds.size.height/2 radius:self.bounds.size.width/2 piecolor:cc.color];
            tt=tt+cc.degrees;
        
    }
    
    if (temp<360) {
        
        [self paintpie:ctx start:tt capacity:360-tt pointx:self.bounds.size.width/2 pointy:self.bounds.size.height/2 radius:self.bounds.size.width/2 piecolor:[UIColor purpleColor]];
    }

    

}

/*
 CGContextRef 中角度范围是0--2PI 本函数参数使用0--360，由函数本身进行相应的转换
 start:(double)pieStart 起始角度
 capacity:(double)pieCapac 角度大小
 圆心
 pointx:(double)x
 pointy:(double)y
 半径
 radius:(double)radius
 填充颜色
 piecolor:(UIColor *)color
 */
-(void)paintpie:(CGContextRef)ctx
          start:(double)pieStart
       capacity:(double)pieCapacity
         pointx:(double)x
         pointy:(double)y
         radius:(double)radius
       piecolor:(UIColor *)color
{
    
    //起始角度，0-360
    double snapshot_start = pieStart;
    
    //结束角度
    double snapshot_finish = pieStart+pieCapacity;
    
    //设置扇形填充色
    CGContextSetFillColor(ctx, CGColorGetComponents( [color CGColor]));
    
    //设置圆心
    CGContextMoveToPoint(ctx, x, y);
    
    //以90为半径围绕圆心画指定角度扇形，0表示逆时针
    CGContextAddArc(ctx, x, y, radius,  radians(snapshot_start), radians(snapshot_finish), 0);
    
    CGContextClosePath(ctx);
    
    CGContextFillPath(ctx);
}

@end
