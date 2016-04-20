//
//  ViewController.m
//  FundamentalFigure
//
//  Created by cenon on 16/4/20.
//  Copyright © 2016年 jaway. All rights reserved.
//

#import "ViewController.h"
#import "FundamentalFigureManager.h"
#import "PieChartcontent.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
    [self pieChart];
    [self TriangleView];
}

-(void)TriangleView
{
     UIView *v=[FundamentalFigureManager triangleWithframe:CGRectMake(60, 20, 50, 50) PointA:CGPointMake(30, 0) PointB:CGPointMake(0, 30) PointC:CGPointMake(40, 30)];
    [v setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:v];
}
-(void)pieChart{
    PieChartcontent *a=[[PieChartcontent alloc]init],*b=[[PieChartcontent alloc]init],*c=[[PieChartcontent alloc]init];
    a.degrees=120;
    a.color=[UIColor redColor];
    b.degrees=120;
    b.color=[UIColor greenColor];
    c.degrees=120;
    c.color=[UIColor blueColor];
    
    NSArray *array=[NSArray arrayWithObjects:a,b,c, nil];
    
    
    UIView *v=[FundamentalFigureManager PieChartViewWithFrame:CGRectMake(0, 20, 50, 50)backGroundcolor:[UIColor whiteColor]  conentArray:array];
    [self.view addSubview:v];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
