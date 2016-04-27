//
//  TimeZone.m
//  测试输出
//
//  Created by shoule on 16/4/27.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "TimeZone.h"

@implementation TimeZone

+ (void)test {
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    
    NSDate *date = [NSDate date];
    NSLog(@"localeDate%@",date);
    
    NSString *timeStamp2 = [dateformatter stringFromDate:date];
    NSLog(@"timeStamp2%@",timeStamp2);
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSLog(@"localeDate%@",localeDate);
    NSString *timeStamp = [dateformatter stringFromDate:localeDate];
    NSLog(@"timeStamp %@",timeStamp);
    NSMutableArray *array = [NSMutableArray array];
    NSString *str = array[1];
}

@end
