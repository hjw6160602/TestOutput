//
//  main.m
//  测试输出
//
//  Created by shoule on 15/5/15.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import "main.h"

void DeleteMutableString(){
    NSMutableString *a = [[NSMutableString  alloc]initWithString:@",,我是你也来,,,,我是真的很累,,,我是真的很累,,"];
    //查找全部匹配的，并替换
    NSString *search = @",,";
    NSString *replace = @",";
    
    NSRange range  = [a rangeOfString:search];
    
    while (range.location != NSNotFound) {
        [a replaceCharactersInRange:range withString:replace];
        range = [a rangeOfString:search];
    }
    NSLog (@"%p,%@",&a, a);
    if ([a hasPrefix:replace]) {
        a = [[a substringFromIndex:1] mutableCopy];
        NSLog (@"%p,%@",&a, a);
    }
    if ([a hasSuffix:replace]) {
        a = [[a substringToIndex:a.length-1] mutableCopy];
        NSLog (@"%p,%@",&a, a);
    }
//    NSLog(@"%@",a);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        DeleteMutableString();
    }
    return 0;
}


void test(){
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





