

//
//  DateTool.m
//  测试输出
//
//  Created by shoule on 15/7/31.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import "DateTool.h"

@implementation DateTool

+ (NSArray *)dateArray:(NSString *)startDate EndDate:(NSString *)endDate
{

    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    // NSString --> NSDate
    NSDate *StartDate = [fmt dateFromString:startDate];
    NSDate *EndDate = [fmt dateFromString:endDate];
    
    // 计算两个日期之间的差值
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *cmps = [calendar components:unit
                                         fromDate:StartDate
                                           toDate:EndDate
                                          options:0];
    

    NSInteger cmpsDay = cmps.day;
    cmps = [NSDateComponents new];
    
    NSMutableArray *dateMutableArray = [[NSMutableArray alloc]init];
    fmt.dateFormat = @"YYYY-MM-dd";
    [dateMutableArray addObject:[fmt stringFromDate:StartDate]];
    
    for (NSInteger i=1; i<=cmpsDay; i++){
        [cmps setDay:i];
        NSDate *temp_Date = [calendar dateByAddingComponents:cmps toDate:StartDate options:0];
        NSString *tempDateStr = [fmt stringFromDate:temp_Date];
        [dateMutableArray addObject:tempDateStr];
    }
    NSArray *dateArray = [dateMutableArray copy];
    
    return dateArray;
}
         
+ (NSDate *)getPriousDateFromDate:(NSDate *)date withMonth:(int)month{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:month];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *mDate = [calendar dateByAddingComponents:comps toDate:date options:0];

    return mDate;
}

         


@end
