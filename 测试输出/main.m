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
#import "FaceExam.h"

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

void sortDictionary(){
    // 1.定义一个测试的字典数组
    NSMutableArray *dictArray = @[
                                  @{
                                      @"FEnabled" : [NSNumber numberWithInt:1],
                                      @"FGroupTag" : [NSNumber numberWithInt:0],
                                      @"FOrder" : [NSNumber numberWithInt:0],
                                      @"FName" : @"宝玉"
                                      },
                                  @{
                                      @"FEnabled" : [NSNumber numberWithInt:1],
                                      @"FGroupTag" : [NSNumber numberWithInt:1],
                                      @"FOrder" : [NSNumber numberWithInt:0],
                                      @"FName" : @"黛玉"
                                      },
                                  @{
                                      @"FEnabled" : [NSNumber numberWithInt:0],
                                      @"FGroupTag" : [NSNumber numberWithInt:1],
                                      @"FOrder" : [NSNumber numberWithInt:1],
                                      @"FName" : @"宝钗"
                                      },
                                  @{
                                      @"FEnabled" : [NSNumber numberWithInt:1],
                                      @"FGroupTag" : [NSNumber numberWithInt:1],
                                      @"FOrder" : [NSNumber numberWithInt:2],
                                      @"FName" : @"湘云"
                                      },
                                  @{
                                      @"FEnabled" : [NSNumber numberWithInt:1],
                                      @"FGroupTag" : [NSNumber numberWithInt:2],
                                      @"FOrder" : [NSNumber numberWithInt:0],
                                      @"FName" : @"妙玉"
                                      },
                                  @{
                                      @"FEnabled" : [NSNumber numberWithInt:1],
                                      @"FGroupTag" : [NSNumber numberWithInt:3],
                                      @"FOrder" : [NSNumber numberWithInt:0],
                                      @"FName" : @"晴雯"
                                      },
                                  @{
                                      @"FEnabled" : [NSNumber numberWithInt:1],
                                      @"FGroupTag" : [NSNumber numberWithInt:3],
                                      @"FOrder" : [NSNumber numberWithInt:1],
                                      @"FName" : @"袭人"
                                      }
                                  
                                  ];
    // NSArray 转成 NSMutableArray
    // 0、对于不启用的,即enabled为0的字典模型,删除掉
    NSMutableArray *dictArr = [NSMutableArray array];
    for (int i = 0; i < dictArray.count; i++) {
        NSDictionary *dict = dictArray[i];
        if ([[dict objectForKey:@"FEnabled"]intValue] == 1) {
            [dictArr addObject:dict];
        }
    }
    // NSLog(@"清除未启用的字典后的数组:%@",dictArr);
    
    // 1、对数组按GroupTag排序
    NSArray *sortDesc = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"FGroupTag" ascending:YES]];
    NSArray *sortedArr = [dictArr sortedArrayUsingDescriptors:sortDesc];
    // NSLog(@"排序后的数组:%@",sortedArr);
    
    
    // 2、对数组进行分组，按GroupTag
    // 遍历,创建组数组,组数组中的每一个元素是一个模型数组
    NSMutableArray *_groupArr = [NSMutableArray array];
    NSMutableArray *currentArr = [NSMutableArray array];
    NSLog(@"class--%@",[currentArr class]);
    // 因为肯定有一个字典返回,先添加一个
    [currentArr addObject:sortedArr[0]];
    [_groupArr addObject:currentArr];
    // 如果不止一个,才要动画添加
    if(sortedArr.count > 1){
        for (int i = 1; i < sortedArr.count; i++) {
            // 先取出组数组中  上一个模型数组的第一个字典模型的groupID
            NSMutableArray *preModelArr = [_groupArr objectAtIndex:_groupArr.count-1];
            int preGroupID = [[[preModelArr objectAtIndex:0] objectForKey:@"FGroupTag"] intValue];
            // 取出当前字典,根据groupID比较,如果相同则添加到同一个模型数组;如果不相同,说明不是同一个组的
            NSDictionary *currentDict = sortedArr[i];
            int groupID = [[currentDict objectForKey:@"FGroupTag"] intValue];
            if (groupID == preGroupID) {
                [currentArr addObject:currentDict];
            }else{
                // 如果不相同,说明 有新的一组,那么创建一个模型数组,并添加到组数组_groupArr
                currentArr = [NSMutableArray array];
                [currentArr addObject:currentDict];
                [_groupArr addObject:currentArr];
            }
        }
    }
    // 3、遍历 对每一组 进行排序
    NSMutableArray *tempGroupArr = [NSMutableArray array];
    for (NSMutableArray *arr in _groupArr) {
        NSArray *sortDesc = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"FOrder" ascending:YES]];
        NSMutableArray *tempArr = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            if([[obj1 objectForKey:@"FOrder"]intValue] < [[obj2 objectForKey:@"FOrder"]intValue]){
                return NSOrderedAscending;
            }
            if([[obj1 objectForKey:@"FOrder"]intValue] > [[obj2 objectForKey:@"FOrder"]intValue]){
                return NSOrderedDescending;
            }
            return NSOrderedSame;
        }];
        [tempGroupArr addObject:tempArr];
    }
    _groupArr = tempGroupArr;
    
    NSLog(@"封装好的group数组:%@",_groupArr);
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

        //dateArray();
        //getNowDateFromatAnDate();
        //DateTest();
//        if([DateTool compareDateWithString:@"2015-08-27" Now:@"2015-08-27"]) NSLog(@"YES");
//        else  NSLog(@"NO");
//        NSLog(@"%@",[NSString hexStringFromString:@"http://openapi.ele.me/v2/restaurants/?consumer_key=7284397484&timestamp=13749080544d31ba58fd73c71db697ab5e4946d52d"]);
//        sortDictionary();
//        [FaceExam test1];
//        [FaceExam test2];
//        [FaceExam test3:"0123456789"];
        
        [FaceExam AppendString];
    }
    return 0;
}








