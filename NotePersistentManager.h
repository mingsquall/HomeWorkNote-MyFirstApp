//
//  NotePersistentManager.h
//  作业记事本
//
//  Created by Patientman on 16/1/24.
//  Copyright © 2016年 Patientman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotePersistentManager : NSObject

//笔记取到-返回笔记，没取到
+(id)getNote;

//存笔记方法
+(BOOL)saveDictionary:(NSDictionary *)dictionary;

//存取成功与否
//不需要外部调用，不用在接口出现
//+(BOOL)saveNote:(NSArray *)note;
@end
