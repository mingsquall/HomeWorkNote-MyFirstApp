//
//  NoteCell.m
//  作业记事本
//
//  Created by Patientman on 16/1/13.
//  Copyright © 2016年 Patientman. All rights reserved.
//

#import "NoteCell.h"


@interface NoteCell()
@property (strong,nonatomic) UILabel *dayLabel;  //自己来声明属性
@property (strong,nonatomic) UILabel *dayOfWeekLabel;
@property (strong,nonatomic) UILabel *yearAndMonthLabel;
@property (strong,nonatomic) UILabel *contentLabel;
@end


@implementation NoteCell

//文字高
+(CGFloat)contentHeight:(NSString *)text{
    CGSize size = CGSizeMake(240, 999999);
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil];
    CGRect rect = [text boundingRectWithSize:size
                                     options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                  attributes:attributes
                                     context:nil];
    CGFloat height = rect.size.height;
    return height;
    //取出了文字内容的高度

}

//表格高
+(CGFloat)cellHeightFromText:(NSString *)text{
    CGFloat height =[NoteCell contentHeight:text];
    CGFloat plannedHeight = height + 140;
    if (plannedHeight > 200) {
        return plannedHeight;
    }
    return 200;
}


-(void)setContentWithDictionary:(NSDictionary *)dictionary{

    self.dayLabel.text = [dictionary objectForKey:@"day"];
    self.dayOfWeekLabel.text = [dictionary objectForKey:@"dayOfWeek"];
    self.yearAndMonthLabel.text = [dictionary objectForKey:@"yearAndMonth"];
    self.contentLabel.text = [dictionary objectForKey:@"content"];
    //根据不同索引来传入
    
    CGFloat contentHeight = [NoteCell contentHeight:self.contentLabel.text];
    CGFloat cellHeight = [NoteCell cellHeightFromText:self.contentLabel.text];
    CGRect rect = CGRectMake(([UIScreen mainScreen].bounds.size.width-240)/2, (cellHeight-contentHeight)/2, 240, contentHeight);
    [self.contentLabel setFrame:rect];
    //把rect应用到表格的文字上去

}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //按照超类的方式去做了一个初始化
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 16, 47, 46)];
    self.dayLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.2];
    self.dayLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:40];
    self.dayLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.dayLabel];
    
    self.dayOfWeekLabel = [[UILabel alloc] initWithFrame:CGRectMake(52,23, 36, 15)];
    self.dayOfWeekLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.3];
    self.dayOfWeekLabel.font = [UIFont systemFontOfSize:12];
    self.dayOfWeekLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.dayOfWeekLabel];
    
    self.yearAndMonthLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 38, 90, 15)];
    self.yearAndMonthLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.3];
    self.yearAndMonthLabel.font = [UIFont systemFontOfSize:10];
    self.yearAndMonthLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.yearAndMonthLabel];
    
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
    self.contentLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.8];
    self.contentLabel.font = [UIFont systemFontOfSize:15];
    self.contentLabel.textAlignment = NSTextAlignmentCenter;
    self.contentLabel.numberOfLines = 0; //表示显示一个多行的文本
    [self.contentView addSubview:self.contentLabel];
    
    return self;

}

+(NoteCell *)prepareCellForTableView:(UITableView *)tableView{

    NoteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"note"];
    //寻找以某一个特定重用标识符 为 标志的 可以重用的条目

    if (cell == nil){
    
        cell = [[NoteCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"note"];
        
    }
    return cell;
    
}

@end