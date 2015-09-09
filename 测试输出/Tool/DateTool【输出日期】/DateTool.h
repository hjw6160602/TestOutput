//
//  DateTool.h
//  测试输出
//
//  Created by shoule on 15/8/27.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DATEFMT_YMD @"YYYY-MM-dd"

@interface DateTool : NSObject
/** 给出两个字符串并比较大小，如从小到大返回 YES */
+ (BOOL)compareDateWithString:(NSString *)Time1 Now:(NSString *)Time2;
@end
