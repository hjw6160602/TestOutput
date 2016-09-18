//
//  InvertInteger.cpp
//  测试输出
//
//  Created by shoule on 16/8/5.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#include "InvertInteger.hpp"


void InvertInteger::numReverse(int num) {
    int modNum = 0;// 余数
    int result = 0;
    
    while (num / 10 != 0) {// 当num为一位数时，跳出循环
        modNum = num % 10;
        num = num / 10;
        result = result * 10 + modNum;
    }
    printf("%d\n", result * 10 + num);// 当num为一位数时，返回结果
}