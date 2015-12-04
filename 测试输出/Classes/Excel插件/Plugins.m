//
//  Plugins.m
//  测试输出
//
//  Created by shoule on 15/12/4.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import "Plugins.h"

@implementation Plugins
//VSTO
/**
 * @func   给定一些数,再给定一个总和,找到这些数字中,哪些数字可以组成这个总和
 *
 * @param  sum:   其中某几个数字的总和
 *         array: 所有的数字
 *
 * @return 打印组成这个和的所有数字
 *
 * @note   考虑所有的可能性组合
 */
- (void)Calulate:(float)sum Array:(NSArray *)array{
    int x = 0;
    //输出一下数组中所有的数字而已，没什么卵用。
    for (NSNumber *number in array) {
        x = number.intValue;
        NSLog(@"%d",x);
    }
    [self Recursion:sum Array:array];
}

- (void)Recursion:(float)sum Array:(NSArray *)array{
    NSInteger count = array.count;
    NSMutableArray *integersArr = [NSMutableArray array];
    for (int i=2; i<=count; i++) {
        //会有多少个数字相加，就创建多少个数字变量，加入一个数组当中
        for (int a=0; a<i; a++){
            int integer = 0;
            NSNumber *number = [NSNumber numberWithInt:integer];
            [integersArr addObject:number];
        }
        
        //这里需要一个递归方法，该方法的功能是在剩下的数组当中，计算总和。
        [self Recursion ];
        int a = 0,b = 0;
        for (int j=0; j<count-1; j++) {
            NSNumber *number = array[j];
            a = number.intValue;
            for (int k=j+1; k<count; k++) {
                NSNumber *number = array[k];
                b = number.intValue;
                if (a+b == sum)
                    NSLog(@"2个数相加情况：%d + %d = %.0f",a,b,sum);
            }
        }
    }
}

@end
