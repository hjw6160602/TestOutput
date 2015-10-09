//
//  FaceExam.m
//  测试输出
//
//  Created by shoule on 15/10/9.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import "FaceExam.h"

@implementation FaceExam

/** 贝思客笔试题目:找错 */
+ (void)test1{
    char string[10];
    char *str1 = "012345678";
    strcpy(string, str1);
}

+ (void)test2{
    int i;
    char string[10],str1[10];
    for (i=0; i<10; i++) {
        str1[i] = 'a';
    }
    //    str1;
    strcpy(string, str1);
    //    string;
}

+ (void)test3:(char *)str1{
    char string[10];
    if (strlen(str1)<10) {
        strcpy(string, str1);
    }
}

+ (void)AppendString{
    for (int i = 0; i <10; i++)
    {
        NSString *string = @"Abc";
        string = [string lowercaseString];
        string = [string stringByAppendingString:@"xyz"];
        NSLog(@"%@", string);
    }
}

@end
