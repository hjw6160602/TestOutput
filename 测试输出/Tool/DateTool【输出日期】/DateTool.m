//
//  DateTool.m
//  测试输出
//
//  Created by shoule on 15/8/27.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import "DateTool.h"



@implementation DateTool

+ (BOOL)compareDateWithString:(NSString *)Time1 Now:(NSString *)Time2{
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = DATEFMT_YMD;
    NSDate *Date1 = [fmt dateFromString:Time1];
    NSDate *Date2 = [fmt dateFromString:Time2];
    NSTimeInterval Interval = [Date1 timeIntervalSinceDate:Date2];
    if (Interval<0) return YES;
    else return NO;
}

@end
