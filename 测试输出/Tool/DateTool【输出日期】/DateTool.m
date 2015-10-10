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

+ (void)dateArray{
    NSString* startDate = @"2014-07-15 00:00:00";
    NSString* endDate = @"2014-08-15 00:00:00";
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    // NSString --> NSDate
    NSDate *StartDate = [fmt dateFromString:startDate];
    NSDate *EndDate = [fmt dateFromString:endDate];
    NSTimeInterval timeInterval = [StartDate timeIntervalSinceDate:EndDate];
    
    NSInteger days = ((int)timeInterval)/(3600*24);
    
    // 计算两个日期之间的差值
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    //    NSDateComponents *cmps = [calendar components:unit
    //                                         fromDate:StartDate
    //                                           toDate:EndDate
    //                                          options:0];
    //
    //
    //    NSInteger cmpsDay = cmps.day;
    NSInteger cmpsDay = labs(days);
    
    NSDateComponents *cmps = [NSDateComponents new];
    
    NSMutableArray *dateMutableArray = [[NSMutableArray alloc]init];
    fmt.dateFormat = @"YYYY-MM-dd";
    [dateMutableArray addObject:[fmt stringFromDate:StartDate]];
    
    for (NSInteger i=1; i<=cmpsDay; i++){
        
        cmps.day=i;
        NSDate *temp_Date = [calendar dateByAddingComponents:cmps toDate:StartDate options:0];
        NSString *tempDateStr = [fmt stringFromDate:temp_Date];
        [dateMutableArray addObject:tempDateStr];
    }
    NSArray *dateArray = [dateMutableArray copy];
    NSLog(@"%@",dateArray);
}

+ (void)DateTest{
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"YYYY-MM-dd";
    NSDate *Nowtime = [fmt dateFromString:@"2015-08-26"];
    NSDate *CurrentDate = [NSDate date];
    NSTimeZone *Zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [Zone secondsFromGMTForDate: CurrentDate];
    NSDate *PhoneDate = [CurrentDate dateByAddingTimeInterval:interval];
    NSDate *resultNowTime = [Nowtime dateByAddingTimeInterval:interval];
    
    NSLog(@"");
}

+ (void)getNowDateFromatAnDate{
    NSDate *anyDate = [NSDate date];
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate] autorelease];
    NSLog(@"%@", destinationDateNow);
}

@end
