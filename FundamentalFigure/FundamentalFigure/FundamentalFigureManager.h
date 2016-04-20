//
//  FundamentalFigureManager.h
//  FundamentalFigure
//
//  Created by cenon on 16/4/20.
//  Copyright © 2016年 jaway. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PieChartView.h"
#import "TriangleView.h"


@interface FundamentalFigureManager : NSObject

//三角形
+(TriangleView*) triangleWithframe:(CGRect)frame
                            PointA:(CGPoint)PointA
                            PointB:(CGPoint)PointB
                            PointC:(CGPoint)PointC;

//饼图
+(PieChartView*)PieChartViewWithFrame:(CGRect)Frame
                      backGroundcolor:(UIColor*)backGroundcolor
                          conentArray:(NSArray*)contentArray;
@end
