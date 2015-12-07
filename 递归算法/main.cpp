//
//  main.cpp
//  递归算法
//
//  Created by shoule on 15/12/7.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#include <iostream>
using namespace std;

/**
 * @strut  保存数据的链表结构体
 *
 * @param  number : 保存数字本身
 *         next   : 保存下一个数据的地址
 */
struct ListNode{
    int number;
    ListNode *last;
};

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
void Example(int sum, int *array,int count){
    int a=0, b=0, c=0, d=0;
    //2个数相加的情况
    for (int j=0; j<count-1; j++) {
        a = array[j];
        for (int k=j+1; k<count; k++) {
            b = array[k];
            if (a+b == sum)
                printf("2个数相加情况：%d + %d = %d \n",a,b,sum);
        }
    }
    //3个数相加的情况
    for (int i=0; i<count-2; i++) {
        a = array[i]; // 取出当前的数目
        for (int j=i+1; j<count-1; j++) {
            b = array[j]; // 取出当前的数目
            for (int k=j+1; k<count; k++) {
                c = array[k]; // 取出当前的数目
                if (a+b+c == sum)
                    printf("3个数相加情况：%d + %d + %d = %d \n",a,b,c,sum);
            }
        }
    }
    //4个数相加的情况
    for (int i=0; i<count-3; i++) {
        a = array[i]; // 取出当前的数目
        for (int j=i+1; j<count-2; j++) {
            b = array[j]; // 取出当前的数目
            for (int k=j+1; k<count-1; k++) {
                c = array[k]; // 取出当前的数目
                for (int l=k+1; l<count; l++)
                    d = array[l];
                if (a+b+c+d == sum)
                    printf("4个数相加情况：%d + %d + %d + %d = %d \n",a,b,c,d,sum);
            }
        }
    }
}

/**
 * @func   回溯找出递归路径
 *
 * @param  指向ListNode类型的指针
 *
 * @note   知道回溯到头结点
 */
void trace2TheSource(ListNode *node, int target){
    //当不为头节点
    if (node->last) {
        //打印当前数字
        ListNode *lastNode = node->last;
        node = lastNode;
        if (node->last) {
            printf(" + %d",node->number);
            trace2TheSource(node, target);
        }
        else printf(" = %d\n", target);
    }
    else printf("回溯结束！");
}

/**
 * @func   给定一个固定数,再给定一些数,找到这些数字中哪些数字可以组成这个总和
 *
 * @param  min          : 当前递归深度下的 数组最小下标取值
 *         max          : 当前递归深度下的 数组最大下标取值
 *         times        : 总共递归次数
 *         time         : 当前递归深度
 *         array        : 数字数数组
 *         count        : 数组的个数
 *         sum          : 当前递归已经加出来的和
 *         target       : 目标总和
 *         list         : 递归路径记录链表
 * @note
 */
void Recursion(int min, int max, int times, int time, int *array, int count, int sum, int target, ListNode *list){
    for (int i = min; i < max; i++) {
        // 新建一个node节点,取出当前index的数
        ListNode node;
        node.number =array[i];
        node.last = list;
        
        // 计算加到当前位置为止的总和
        sum +=  node.number;
        
        if (sum == target) {
            if (time == times) {
                printf("%d个数相加情况: %d",times+1,node.number);
                //遍历列表，从树叶->树根的顺数找出递归路径，输出所有数字
                trace2TheSource(&node,target);
//                printf("%d个数: %d,%d\n",times+1, last, integer);
            }
            sum -=  node.number;
            continue;
        }
        else if (sum < target){
            if (max+1 <= count) {
                Recursion(i+1, max+1, times, time+1, array, count, sum, target, &node);
                sum -=  node.number;
            }
            else{
                sum -=  node.number;
                continue;
            }
        }
        else if (sum > target){
            sum -=  node.number;
            return;
        }
    }
}


/** 打印数组内的元素 */
void printArray(int *array,int count){
    for (int i=0; i<count; i++) {
        printf("%d,",array[i]);
    }
    printf("\n");
}

/** 对数组进行排序 */
void sortArray(int *array,int count){
    int temp;
    //此处采用选择排序
    for(int i=0; i<count-1; i++){
        for(int j=i+1; j<count; j++)
            if(array[i] > array[j]){
                temp = array[i];
                array[i]=array[j];
                array[j]=temp;
            }
    }
    printf("排序后数组内的数据为：\n");
    printArray(array, count);
    
}

/** 初始化数据 */
void Caculate(){
    // 1.初始化数据
    int target = 110;
    int a[] = {88,65,78,45,22,86,89,48,55};
    int count = sizeof(a)/sizeof(a[0]);
    printf("原始数组内的数据为：\n");
    printArray(a, count);
    
    // 2.对数组进行排序
    sortArray(a,count);
    
    // 3.主算法
    Example(target, a, count);
    printf("固定和：%d\n",target);
    
    // 初始化链表,头结点
    ListNode header;
    header.number = 0;
    header.last = NULL;
    
    // 最少是两个数相加，最多的时候是所有的数字相加
    for (int k=1; k < count; k++) {
        Recursion(0, count-k, k, 0, a, count, 0, target, &header);
    }
}

int main(int argc, const char * argv[]) {
    Caculate();
    cout << "算法结束！\n";
    return 0;
}
