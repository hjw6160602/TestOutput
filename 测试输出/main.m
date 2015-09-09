//
//  main.m
//  测试输出
//
//  Created by shoule on 15/5/15.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DateTool.h"
#import "NSString+HexStringFromString.h"

#pragma - 字符串的mutableCopy方法
void stringMutableCopy(){
    NSArray *array = [NSArray array];
    NSLog(@"array的计数:%zi",[array retainCount]);
}

/** 普通的局部变量，block内部只会引用它初始的值（block定义那一刻），不能跟踪它的改变
 *  block内部能够一直引用被__block修饰的变量
 *  block内部能够一直引用被static修饰的变量
 *  block内部能够一直引用全局变量
 */

void test(){
    __block int age = 10;
    
    void (^block)() = ^(){
        NSLog(@"-----age = %d",age);
    };
    age = 20;
    block();
}

void randomBigWheel(){
    while (1){
        NSInteger x = arc4random() % 6;
        printf("x:%ld\n",(long)x);
    }
}

/**
 * 正则表达式
 */
void RegEx(){
    NSString *string = @"as8f486as4f6as54";
    NSString *patter = @"\\d{3}";
    NSRegularExpression *regex = [[NSRegularExpression alloc]initWithPattern:patter
                                                                    options:0
                                                                       error:0];
    NSArray *array = [regex matchesInString:string
                                    options:0
                                      range:NSMakeRange(0,string.length)];
    NSLog(@"%ld",array.count);
}


void compareNSString(){
    //NSOrderedAscending = -1,
    //NSOrderedSame,
    //NSOrderedDescending = 1;
    NSComparisonResult result =  [@"3.0.0.2" compare:@"3.0.1"];
    NSLog(@"%ld",(long)result);
}

void testMutableArray(){
    NSArray *array = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",nil];
    NSMutableArray *mutableArray = [[NSMutableArray alloc]initWithArray:array];//array;
    [mutableArray addObject:@"4"];
    NSLog(@"array's address is:%@",mutableArray);
}

void JzbTest(){
    NSString *money = @"147.99";
    NSNumber *num=[NSNumber numberWithFloat:money.floatValue];
    
    NSString *str=[NSString stringWithFormat:@"%.2f",num.floatValue];
    NSLog(@"%@",str);
}

/** 贝思客笔试题目:找错 */
void test1(){
    char string[10];
    
    char *str1 = "012345678";
    strcpy(string, str1);
}

void test2(){
    int i;
    char string[10],str1[10];
    for (i=0; i<10; i++) {
        str1[i] = 'a';
    }
//    str1;
    strcpy(string, str1);
//    string;
}

void test3(char *str1){
    char string[10];
    if (strlen(str1)<10) {
        strcpy(string, str1);
    }
}

void dateArray(){
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

void DateTest(){
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

void getNowDateFromatAnDate(){
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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //stringMutableCopy();
        //test();
        //randomBigWheel();
        //RegEx();
        //compareNSString();
        //printDate();
        //testMutableArray();
        //JzbTest();
        //test1();
        //test2();
        //test3("0123456789");
        //dateArray();
        //getNowDateFromatAnDate();
        //DateTest();
//        if([DateTool compareDateWithString:@"2015-08-27" Now:@"2015-08-27"]) NSLog(@"YES");
//        else  NSLog(@"NO");
        NSLog(@"%@",[NSString hexStringFromString:@"http://openapi.ele.me/v2/restaurants/?consumer_key=7284397484&timestamp=13749080544d31ba58fd73c71db697ab5e4946d52d"]);
    }
    return 0;
}








