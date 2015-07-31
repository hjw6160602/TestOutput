//
//  main.m
//  测试输出
//
//  Created by shoule on 15/5/15.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DateTool.h"

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

void printDate(){
    NSArray *array = [DateTool dateArray:@"2012-02-26 14:15:17" EndDate:@"2012-03-06 14:15:17"];
    for (NSString *date in array) {
        NSLog(@"%@",date);
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //stringMutableCopy();
        //test();
        //randomBigWheel();
        //RegEx();
        //compareNSString();
        printDate();
    }
    return 0;
}







