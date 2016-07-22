//
//  NotePersistentManager.m
//  作业记事本
//
//  Created by Patientman on 16/1/24.
//  Copyright © 2016年 Patientman. All rights reserved.
//

#import "NotePersistentManager.h"

@implementation NotePersistentManager


+(BOOL)saveDictionary:(NSDictionary *)dictionary{
    id array = [NotePersistentManager getNote];
    if (array != nil) {
        //继续存储
        NSMutableArray *note = [NSMutableArray arrayWithArray:array];
        [note addObject:dictionary];
        return [NotePersistentManager saveNote:note];
    }
    return NO;

}

+(id)getNote{
    NSArray *docsDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dirPath = docsDir[0];
    NSString *dataFilePath = [[NSString alloc]initWithString:[dirPath stringByAppendingPathComponent:@"note"]];
    //把文件路径找到
    
    NSFileManager *manager = [NSFileManager defaultManager];
    //管理文件的对象
    
    BOOL fileExist = [manager fileExistsAtPath:dataFilePath];
    //用管理文件的对象检查 返回 file是否存在
    
    //若存在就读取 不存在就返回一个空数组
    //这个过程中如果出错了 就返回一个nil
    @try {
        if (fileExist) {
            NSArray *note = [NSKeyedUnarchiver unarchiveObjectWithFile:dataFilePath];
            return note;
        } else {
            NSArray *note = [[NSArray alloc]init];
            return note;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
    //什么都不做
    }
}


    //存取成功与否
+(BOOL)saveNote:(NSArray *)note{
    NSArray *docsDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dirPath = docsDir[0];
    NSString *dataFilePath = [[NSString alloc]initWithString:[dirPath stringByAppendingPathComponent:@"note"]];
    //把文件路径找到
    
    @try {
        BOOL saveSuccess = [NSKeyedArchiver archiveRootObject:note toFile:dataFilePath];
        return saveSuccess;
    }
    @catch (NSException *exception) {
        return NO;
    }
    @finally {
    //什么都不做
    }
    
}



@end
