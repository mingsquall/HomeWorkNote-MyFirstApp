//
//  NoteCell.m
//  作业记事本
//
//  Created by Patientman on 16/1/13.
//  Copyright © 2016年 Patientman. All rights reserved.
//

#import "NoteCell.h"

@implementation NoteCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //按照超类的方式去做了一个初始化
    UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 16, 47, 46)];
    dayLabel.text = @"12";
    dayLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.2];
    dayLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:40];
    dayLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:dayLabel];
    
    UILabel *dayOfWeekLabel = [[UILabel alloc] initWithFrame:CGRectMake(52,23, 36, 15)];
    dayOfWeekLabel.text = @"星期二";
    dayOfWeekLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.3];
    dayOfWeekLabel.font = [UIFont systemFontOfSize:12];
    dayOfWeekLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:dayOfWeekLabel];
    
    UILabel *yearAndMonthLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 38, 90, 15)];
    yearAndMonthLabel.text = @"2016年1月12日";
    yearAndMonthLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.3];
    yearAndMonthLabel.font = [UIFont systemFontOfSize:10];
    yearAndMonthLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:yearAndMonthLabel];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-240)/2,79,240,42)];
    contentLabel.text = @"「here we go again」";
    contentLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.8];
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:contentLabel];

    
    return self;

}

@end
