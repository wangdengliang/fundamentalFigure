//
//  FundamentalFigureManager.m
//  FundamentalFigure
//
//  Created by cenon on 16/4/20.
//  Copyright © 2016年 jaway. All rights reserved.
//

#import "FundamentalFigureManager.h"

@implementation FundamentalFigureManager
+(PieChartView*)PieChartViewWithFrame:(CGRect)Frame
                      backGroundcolor:(UIColor*)backGroundcolor
                          conentArray:(NSArray*)contentArray
{
    
    PieChartView *pv=[[PieChartView alloc]initWithFrame:Frame];
    pv.contentArray=contentArray;
    [pv setBackgroundColor:backGroundcolor];

    return pv;
}
+(TriangleView*) triangleWithframe:(CGRect)frame
                            PointA:(CGPoint)PointA
                            PointB:(CGPoint)PointB
                            PointC:(CGPoint)PointC
{
    TriangleView *v=[[TriangleView alloc]initWithFrame:frame];
    v.pointA=PointA;
    v.pointB=PointB;
    v.pointC=PointC;
    return v;
}
@end
