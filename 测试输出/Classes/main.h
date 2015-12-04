//
//  main.h
//  测试输出
//
//  Created by shoule on 15/11/20.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#ifndef main_h
#define main_h

#import <Foundation/Foundation.h>
#import "NSString+HexStringFromString.h"
#import "DateTool.h"
#import "FaceExam.h"
#import "SORT.h"
#import "MutiThred.h"
#import "Person.h"



#pragma - 字符串的mutableCopy方法
//void stringMutableCopy(){
//    NSArray *array = [NSArray array];
//    NSLog(@"array的计数:%zi",[array retainCount]);
//}

/** 普通的局部变量，block内部只会引用它初始的值（block定义那一刻），不能跟踪它的改变
 *  block内部能够一直引用被__block修饰的变量
 *  block内部能够一直引用被static修饰的变量
 *  block内部能够一直引用全局变量
 */

//void test(){
//    __block int age = 10;
//    
//    void (^block)() = ^(){
//        NSLog(@"-----age = %d",age);
//    };
//    age = 20;
//    block();
//}

/**
 * 正则表达式
 */
//void RegEx(){
//    NSString *string = @"as8f486as4f6as54";
//    NSString *patter = @"\\d{3}";
//    NSRegularExpression *regex = [[NSRegularExpression alloc]initWithPattern:patter
//                                                                     options:0
//                                                                       error:0];
//    NSArray *array = [regex matchesInString:string
//                                    options:0
//                                      range:NSMakeRange(0,string.length)];
//    NSLog(@"%ld",array.count);
//}

//void dateTool(){
//    if([DateTool compareDateWithString:@"2015-08-27" Now:@"2015-08-27"]) NSLog(@"YES");
//    else  NSLog(@"NO");
//    [DateTool dateArray];
//    [DateTool getNowDateFromatAnDate];
//    [DateTool DateTest];
//}


//void faceExam(){
//    [FaceExam test1];
//    [FaceExam test2];
//    [FaceExam test3:"0123456789"];
//    [FaceExam AppendString];
//}


//        stringMutableCopy();
//        test();
//        RegEx();
//        [SORT sortDictionary];

//      /** 多线程 */
//        MutiThred *mutiThred = [[MutiThred alloc]init];
//        [mutiThred ThredRun];

/*
void person(){
    Person *p = [[Person alloc]init];
    SEL sel1 = @selector(meditation);
    BOOL flag1 = [p respondsToSelector:sel1];
    NSLog(@"flag = %i",flag1);
    
    SEL sel2 = @selector(test);
    // respondsToSelector:返回一个BOOL值，代表该对象是否实现了该方法
    BOOL flag2 = [p respondsToSelector:sel2];
    NSLog(@"flag = %i",flag2);
    
    SEL sel3 = @selector(sleep);
    
    [p performSelector:sel3];
}*/

#endif /* main_h */
