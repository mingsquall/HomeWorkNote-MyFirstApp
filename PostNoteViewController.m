//
//  PostNoteViewController.m
//  作业记事本
//
//  Created by Patientman on 16/1/24.
//  Copyright © 2016年 Patientman. All rights reserved.
//

#import "PostNoteViewController.h"
#import "NoteUtility.h"
#import "NotePersistentManager.h"

@interface PostNoteViewController ()
@property (nonatomic,strong) UITextView *inputView;

@end

@implementation PostNoteViewController


- (void)saveNote{
    //内容
    NSString *content = self.inputView.text;
    //时间戳
    NSNumber *timestamp = [NoteUtility timestamp];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:content,@"content",
                                                                          timestamp,@"timestamp",nil];
    BOOL saveSuccess = [NotePersistentManager saveDictionary:dictionary];
    
    if (saveSuccess) {
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        NSNotification *notification = [NSNotification notificationWithName:@"newNoteSaved" object:nil];
        [center postNotification:notification];
        //通知去刷新
        
        //把自己收掉
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    

    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setSingleLineTitle:@"作业记录"];
    //完成按钮；取消按钮
    UIBarButtonItem *finishButton =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(saveNote)];
    UIBarButtonItem *cancelButton =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem =finishButton;
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    self.inputView = [[UITextView alloc] initWithFrame:CGRectMake(0, 84, [UIScreen mainScreen].bounds.size.width, 250)];
    
    [self.view addSubview:self.inputView];
    [self.inputView becomeFirstResponder];
    //输入框变成焦点,自动弹出键盘
    
    self.inputView.delegate = self;
    self.inputView.editable = YES;
    
}

-(void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
    //点cancel把页面收起来
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
