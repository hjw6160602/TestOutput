//
//  CombineArr.cpp
//  测试输出
//
//  Created by shoule on 16/8/4.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

//#include<iostream>
#include "CombineArr.h"

#define GET_ARRAY_LEN(array,count){ count = (sizeof(array)/sizeof(array[0])); }

//using namespace std;

template <class T>
int getArrayLen(T& array){
    //使用模板定义一个函数getArrayLen,该函数将返回数组array的长度
    return (sizeof(array) / sizeof(array[0]));
}

void CombineArr::test(){
    int ArrA[] = { 2,4,6,8 };
    int ArrB[] = { 1,3,5,7 };
    int Arr[8];
    int m = getArrayLen(ArrA);
    int n = getArrayLen(ArrB);
    Description(ArrA, m);
    Description(ArrB, n);
    MergeArray(ArrA, m, ArrB, n, Arr);
    Description(Arr, 8);
}



void CombineArr::Description(int *Arr, int count){
    //    GET_ARRAY_LEN(Arr,count);
    for (int i = 0; i < count; i++) {
        int num = Arr[i];
        printf("%d ",num);
        if (i == count-1) printf("\n");
    }
}

// pArray1和pArray2是已经排好序的数组,要求将它们按照顺序合并到pArray中
// 排序之后的数组不会有重复的元素
void CombineArr::MergeArray(int *pArr1, int nLen1, int *pArr2, int nLen2, int *pArr)
{
    int i, j, n;
    i = j = n = 0;
    while (i < nLen1 && j < nLen2)
    {// 循环一直进行到拷贝完某一个数组的元素为止
        if (pArr1[i] < pArr2[j])
        {// 拷贝array1的元素
            pArr[n++] = pArr1[i++];
        }
        else if (pArr1[i] > pArr2[j])
        {// 拷贝array2的元素
            pArr[n++] = pArr2[j++];
        }
        else
        { // 相等的元素拷贝
            pArr[n++] = pArr2[j++];
            ++i;
        }
    }
    if (i == nLen1)
    {// 如果array1已经被拷贝完毕就拷贝array2的元素
        while (j < nLen2)
            pArr[n++] = pArr2[j++];
    }
    else
    {// 如果array2已经被拷贝完毕就拷贝array1的元素
        while (i < nLen1)
            pArr[n++] = pArr1[i++];
    }
}