//
//  MomentListViewController.m
//  作业记事本
//
//  Created by Patientman on 16/1/11.
//  Copyright © 2016年 Patientman. All rights reserved.
//

#import "MomentListViewController.h"
#import "NoteCell.h"
#import "MomentDetailViewController.h"
#import "PostNoteViewController.h"
#import "NotePersistentManager.h"
#import "NoteUtility.h"

@interface MomentListViewController ()

@property (nonatomic,strong) NSArray *note;

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation MomentListViewController

-(void)viewWillAppear:(BOOL)animated{
    if (self.tableView != nil) {
        //找到被选中的哪一行
        NSIndexPath *selectingRow = [self.tableView indexPathForSelectedRow]; //返回当前选中这一行的indexPath
        
        if (selectingRow != nil) {
            [self.tableView deselectRowAtIndexPath:selectingRow animated:YES];
        }
        //取消这一行的选中状态
        
        
    }

}

-(void)loadNote{
    NSMutableArray *noteBeforeSorting = [NotePersistentManager getNote];
    self.note = [noteBeforeSorting sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *a,NSDictionary *b) {
        NSNumber *aTimeStamp = [a objectForKey:@"timestamp"];
        NSNumber *bTimeStamp = [b objectForKey:@"timestamp"];
        //如果A更新，A排在B之前
        if (aTimeStamp > bTimeStamp) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        //如果B更新，B排在A前面
        if (bTimeStamp > aTimeStamp) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        //如果一样，则顺序不变
        return (NSComparisonResult)NSOrderedDescending;
    }];
    [self.tableView reloadData];
    //重新调用协议里面的方法
}

- (void)post{
    PostNoteViewController *post = [[PostNoteViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:post];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    //post挂到nav上 点击post按钮后 弹出

}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(loadNote) name:@"newNoteSaved" object:nil];
    [self loadNote];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
    self.tableView.dataSource = self;
    //数据源协议其实就是自身的实例
    self.tableView.delegate = self;
    //代理协议也是自身的实例
    
    UIBarButtonItem *post = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(post)];
    //点了button以后便会让self调用一个叫做post的方法
    
    self.navigationItem.rightBarButtonItem = post;
    //导航栏右侧按钮
    
    [self.view addSubview:self.tableView];

    [self setSingleLineTitle:@"作业记事本"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.note == nil) {
        return 0;
    }
    return [self.note count];
    //规定了表格有多少行
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NoteCell *cell = [NoteCell prepareCellForTableView:tableView];
    NSInteger row = indexPath.row;
    
    NSDictionary *dictionary = self.note[row];
    //dictionary和object一一对应
    NSNumber *timestamp = [dictionary objectForKey:@"timestamp"];
    NSMutableDictionary *dateDictionary = [NoteUtility dateNow:timestamp];
    NSString *year = [dateDictionary objectForKey:@"year"];
    NSString *month = [dateDictionary objectForKey:@"month"];
    NSString *yearAndMonth = [NSString stringWithFormat:@"%@年%@月",year,month];
    [dateDictionary setObject:yearAndMonth forKey:@"yearAndMonth"];
    [dateDictionary addEntriesFromDictionary:dictionary];
    
    [cell setContentWithDictionary:dateDictionary];
    return cell;
}

    //tell the delegate that the row selected
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSDictionary *dictionary = self.note[row];
    NSNumber *timestamp = [dictionary objectForKey:@"timestamp"];
    
    NSMutableDictionary *dateDictionary = [NoteUtility dateNow:timestamp];
    NSString *year = [dateDictionary objectForKey:@"year"];
    NSString *month = [dateDictionary objectForKey:@"month"];
    NSString *day = [dateDictionary objectForKey:@"day"];
    NSString *yearAndMonthAndDay = [NSString stringWithFormat:@"%@年%@月%@日",year,month,day];
    [dateDictionary setObject:yearAndMonthAndDay forKey:@"yearAndMonthAndDay"];
    [dateDictionary addEntriesFromDictionary:dictionary];
    
    MomentDetailViewController *detail = [[MomentDetailViewController alloc]initWithDictionary:dateDictionary];
    //实例化 初始化
    
    [self.navigationController pushViewController:detail animated:YES];
    //把detail页面推进来 要动画


}


-(CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{

    NSInteger row = indexPath.row;
    NSDictionary *dictionary = self.note[row];
    NSString *content = [dictionary objectForKey:@"content"];
    
    CGFloat height = [NoteCell cellHeightFromText:content];
    
    return height;
    

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