//
//  BaseViewController.m
//  作业记事本
//
//  Created by Patientman on 16/1/11.
//  Copyright © 2016年 Patientman. All rights reserved.
//

#import "BaseViewController.h"
//BaseViewController （拥有蓝色的标题栏 以及 灰色的背景颜色）
@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)setSingleLineTitle:(NSString *)title{
    // 自定义导航栏标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    titleLabel.text = title; //标题 需要根据传入的参数title做变化
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = titleLabel; //把titleLabel显示给用户 的第一种方法
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 自定义背景颜色
    UIColor *gray = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
    self.view.backgroundColor = gray;
    // 自定义导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:27.0/255 green:161.0/255 blue:226.0/255 alpha:1];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
