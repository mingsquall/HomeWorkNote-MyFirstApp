//
//  NoteUtility.h
//  作业记事本
//
//  Created by Patientman on 16/1/26.
//  Copyright © 2016年 Patientman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoteUtility : NSObject

+(NSNumber *)timestamp;
+(NSMutableDictionary *)dateNow:(NSNumber *)timestamp;

@end
