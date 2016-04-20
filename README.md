#简单的图形绘制
##图形绘制的步骤
---
*UIview自定义时会调用系统函数

**- (void)drawRect:(CGRect)rect

**简单会图形绘制是在这个函数中进行的

***1.获取图形操作上下文 

***CGContextRef ctx = UIGraphicsGetCurrentContext();  

***2.对图形上下文进行操作

***请参考customview.m

***3.关闭图形上下文路径

***CGContextClosePath(ctx);

***4.绘制图形

***CGContextStrokePath(ctx);

##饼图的绘制
---

##三角形绘制

##弧形绘制

##矩形绘制

