//
//  PieChartcontent.h
//  FundamentalFigure
//
//  Created by cenon on 16/4/20.
//  Copyright © 2016年 jaway. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PieChartcontent : NSObject
@property(copy,nonatomic)NSString *content;
@property(assign,nonatomic)double  degrees;
@property(nonatomic)UIColor *color;
@end
