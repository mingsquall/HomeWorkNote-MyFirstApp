//
//  MomentListViewController.m
//  作业记事本
//
//  Created by Patientman on 16/1/11.
//  Copyright © 2016年 Patientman. All rights reserved.
//

#import "MomentListViewController.h"

@interface MomentListViewController ()

@end

@implementation MomentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];

    [self.view addSubview:tableView];
    tableView.dataSource = self;
    //数据源协议其实就是自身的实例
    
    tableView.delegate = self;
    //代理协议也是自身的实例
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setSingleLineTitle:@"作业记事本"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
    //规定了表格有多少行（表格返回值是1行）
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"moment"];
    //寻找以某一个特定重用标识符 为 标志的 可以重用的条目
    
    //如果cell == nil 那么就初始化一个实例
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"moment"];
        UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 16, 47, 46)];
        dayLabel.text = @"12";
        dayLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.2];
        dayLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:40];
        dayLabel.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:dayLabel];
        
        UILabel *dayOfWeekLabel = [[UILabel alloc] initWithFrame:CGRectMake(52,23, 36, 15)];
        dayOfWeekLabel.text = @"星期二";
        dayOfWeekLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.3];
        dayOfWeekLabel.font = [UIFont systemFontOfSize:12];
        dayOfWeekLabel.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:dayOfWeekLabel];
        
        UILabel *yearAndMonthLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 38, 90, 15)];
        yearAndMonthLabel.text = @"2016年1月12日";
        yearAndMonthLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.3];
        yearAndMonthLabel.font = [UIFont systemFontOfSize:10];
        yearAndMonthLabel.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:yearAndMonthLabel];
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-240)/2,79,240,42)];
        contentLabel.text = @"「here we go again」";
        contentLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.8];
        contentLabel.font = [UIFont systemFontOfSize:15];
        contentLabel.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:contentLabel];
        
        
        

    }
    return cell;

}

-(CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{

    return 200.0;
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
