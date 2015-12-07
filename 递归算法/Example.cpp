//
//  Example.cpp
//  测试输出
//
//  Created by shoule on 15/12/7.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#include "Example.hpp"

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
//void Example(long sum, long *array,int count){
//    long a=0, b=0, c=0, d=0;
//    //2个数相加的情况
//    for (int j=0; j<count-1; j++) {
//        a = array[j];
//        for (int k=j+1; k<count; k++) {
//            b = array[k];
//            if (a+b == sum)
//                printf("2个数相加情况：%.2f + %.2f = %.2f \n",a,b,sum);
//        }
//    }
//    //3个数相加的情况
//    for (int i=0; i<count-2; i++) {
//        a = array[i]; // 取出当前的数目
//        for (int j=i+1; j<count-1; j++) {
//            b = array[j]; // 取出当前的数目
//            for (int k=j+1; k<count; k++) {
//                c = array[k]; // 取出当前的数目
//                if (a+b+c == sum)
//                    printf("3个数相加情况：%.2f + %.2f + %.2f = %.2f \n",a,b,c,sum);
//            }
//        }
//    }
//    //4个数相加的情况
//    for (int i=0; i<count-3; i++) {
//        a = array[i]; // 取出当前的数目
//        for (int j=i+1; j<count-2; j++) {
//            b = array[j]; // 取出当前的数目
//            for (int k=j+1; k<count-1; k++) {
//                c = array[k]; // 取出当前的数目
//                for (int l=k+1; l<count; l++)
//                    d = array[l];
//                if (a+b+c+d == sum)
//                    printf("4个数相加情况：%.2f + %.2f + %.2f + %.2f = %.2f \n",a,b,c,d,sum);
//            }
//        }
//    }
//}