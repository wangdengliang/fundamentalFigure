//
//  CustomView.m
//  FundamentalFigure
//
//  Created by cenon on 16/4/20.
//  Copyright © 2016年 jaway. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

}

#pragma mark- 画文字
 //画文字
 void drawText()
{
    // 1.获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画矩形
    CGRect cubeRect = CGRectMake(50, 50, 100, 100);
    CGContextAddRect(ctx, cubeRect);
    // 3.显示所绘制的东西
    CGContextFillPath(ctx);
    
    
    
    // 4.画文字
    NSString *str = @"哈哈哈哈Good morning hello hi hi hi hi";
    //    [str drawAtPoint:CGPointZero withAttributes:nil];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    // NSForegroundColorAttributeName : 文字颜色
    // NSFontAttributeName : 字体
    attrs[NSForegroundColorAttributeName] = [UIColor redColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    [str drawInRect:cubeRect withAttributes:attrs];
}

#pragma mark- drawImage
 void drawImage()
 {
 // 1.取得图片
 UIImage *image = [UIImage imageNamed:@"me"];
 
 // 2.画
 //    [image drawAtPoint:CGPointMake(50, 50)];
 //    [image drawInRect:CGRectMake(0, 0, 150, 150)];
 [image drawAsPatternInRect:CGRectMake(0, 0, 200, 200)];
 
 // 3.画文字
 NSString *str = @"为xxx所画";
 [str drawInRect:CGRectMake(0, 180, 100, 30) withAttributes:nil];
 }
#warning 在绘制的时候 当设置了ctx 的颜色的时候 再绘制其他的图时，颜色需要重置，很麻烦，解决方法是重置 ctx 如下

 /// 将ctx拷贝一份放到栈中
// CGContextSaveGState(ctx);
// 
// // 设置绘图状态
// CGContextSetLineWidth(ctx, 10);
// [[UIColor redColor] set];
// CGContextSetLineCap(ctx, kCGLineCapRound);
// 
// // 第1根线
// CGContextMoveToPoint(ctx, 50, 50);
// CGContextAddLineToPoint(ctx, 120, 190);
// 
// CGContextStrokePath(ctx);
// 
// // 将栈顶的上下文出栈,替换当前的上下文
// CGContextRestoreGState(ctx);

 
 
#pragma mark- 整个ctx 的旋转 移动
 //整个ctx 的旋转 移动
 
// [objc] view plain copy
// 在CODE上查看代码片派生到我的代码片
// 
// CGContextRotateCTM(ctx, M_PI_4 * 0.3);
// CGContextScaleCTM(ctx, 0.5, 0.5);
// CGContextTranslateCTM(ctx, 0, 150);

 
 
 
#pragma mark - 图片的裁剪 思路是 裁剪ctx的显示区域
// 图片的裁剪 思路是 裁剪ctx的显示区域
// 
// [objc] view plain copy
// 在CODE上查看代码片派生到我的代码片

// - (void)drawRect:(CGRect)rect
// {
// CGContextRef ctx = UIGraphicsGetCurrentContext();
// 
// CGContextSaveGState(ctx);
// 
// // 0.画圆
// CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 50, 50));
// // 裁剪
// CGContextClip(ctx);
// CGContextFillPath(ctx);
// 
// // 1.显示图片
// UIImage *image = [UIImage imageNamed:@"me"];
// [image drawAtPoint:CGPointMake(100, 100)];
// 
// CGContextRestoreGState(ctx);
// 
// CGContextAddRect(ctx, CGRectMake(0, 0, 50, 50));
// CGContextFillPath(ctx);
// }

 
#pragma mark- 动画
// 动画
// 
// CADisplayLink 是一个定时器，特点 刷新频率高，  setNeedsDisplay方法起重新绘制的作用
// 
// [objc] view plain copy
// 在CODE上查看代码片派生到我的代码片

 - (void)awakeFromNib
 {
 CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
 [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
 
 //    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
 }
 
// - (void)drawRect:(CGRect)rect
// {
// self.snowY+=5;
// 
// if (self.snowY >= rect.size.height) {
// self.snowY = -100;
// }
// 
// UIImage *image = [UIImage imageNamed:@"snow.jpg"];
// [image drawAtPoint:CGPointMake(0, self.snowY)];
// }

 
#pragma mark - 通过路径画图
// 通过路径画图
// [objc] view plain copy
// 在CODE上查看代码片派生到我的代码片

// - (void)drawRect:(CGRect)rect
// {
// CGContextRef ctx = UIGraphicsGetCurrentContext();
// 
// // 1.先创建一个路径
// CGMutablePathRef linePath = CGPathCreateMutable();
// 
// 
// 
// // 2.拼接路径
// CGPathMoveToPoint(linePath, NULL, 0, 0);
// CGPathAddLineToPoint(linePath, NULL, 100, 100);
// 
// // 3.添加路径到上下文
// CGContextAddPath(ctx, linePath);
// 
// CGMutablePathRef circlePath = CGPathCreateMutable();
// CGPathAddArc(circlePath, NULL, 150, 150, 50, 0, M_PI * 2, 0);
// CGContextAddPath(ctx, circlePath);
// 
// // 4.渲染
// CGContextStrokePath(ctx);
// 
// 
// CGPathRelease(linePath);
// CGPathRelease(circlePath);
// 
// 
// CGColorSpaceRef cs = CGColorSpaceCreateDeviceRGB();
// CGColorSpaceRelease(cs);
// 
// //    CFRelease(linePath);
// //    CFRelease(circlePath);
// //    CFRelease(cs);
// }



@end
