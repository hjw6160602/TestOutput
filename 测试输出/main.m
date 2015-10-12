//
//  main.m
//  测试输出
//
//  Created by shoule on 15/5/15.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+HexStringFromString.h"
#import "DateTool.h"
#import "FaceExam.h"
#import "SORT.h"
#import "MutiThred.h"

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

//        [DateTool dateArray];
//        [DateTool getNowDateFromatAnDate];
//        [DateTool DateTest];
        
//        if([DateTool compareDateWithString:@"2015-08-27" Now:@"2015-08-27"]) NSLog(@"YES");
//        else  NSLog(@"NO");

//        [SORT sortDictionary];
//        [FaceExam test1];
//        [FaceExam test2];
//        [FaceExam test3:"0123456789"]
//        [FaceExam AppendString];
        MutiThred *mutiThred = [[MutiThred alloc]init];
        [mutiThred ThredRun];
    }
    return 0;
}








