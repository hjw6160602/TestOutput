//
//  main.cpp
//  递归算法
//
//  Created by shoule on 15/12/7.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#include <iostream>
#include <fstream>

#define MAC_PATH_I "./input.txt"
#define MAC_PATH_O "./output.txt"

#define WIN_PATH_I "C:\\Users\\Snow\\Desktop\\input.txt"
#define WIN_PATH_O "C:\\Users\\Snow\\Desktop\\output.txt"

using namespace std;
ofstream outputFile;
/**
 * @strut  保存数据的链表结构体
 *
 * @param  number : 保存数字本身
 *         next   : 保存下一个数据的地址
 */
struct ListNode{
    long number;
    ListNode *last;
};

/**
 * @func   回溯找出递归路径
 *
 * @param  指向ListNode类型的指针
 *
 * @note   知道回溯到头结点
 */
void trace2TheSource(ListNode *node, long sum, long target){
    //当不为头节点
    if (node->last) {
        //打印当前数字
        ListNode *lastNode = node->last;
        node = lastNode;
        if (node->last) {
            double number = node->number/100.00;
//            printf("%.2f,",number);
            printf(" + %.2f",number);
            outputFile<<number<<endl;
            trace2TheSource(node, sum, target);
        }
        else {
            double number = sum/100.00;
            printf(" = %.2f\n", number);
            outputFile<<"总和："<<number<<endl;
        }
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
void Recursion(int min, int max, int times, int time, long *array, int count, long sum, long target, ListNode *list){
    for (int i = min; i < max; i++) {
        // 新建一个node节点,取出当前index的数
        ListNode node;
        node.number =array[i];
        node.last = list;
        
        // 计算加到当前位置为止的总和
        sum +=  node.number;
        long x = 0;
        if (sum<0)
            x = abs(target + sum);
        else x = abs(target- sum);
        
        if (x < 3) {
            if (time == times) {
                printf("%d个数相加情况:\n",times+1);
                double number1 = sum/100.00;
                double number2 = target/100.00;
                printf("sum : %.2f,   target : %.2f\n",number1,number2);
                
                double number3 = node.number/100.00;
                printf("%.2f",number3);
                
                outputFile<<times+1<<"个数相加情况: "<<endl<<number3<<endl;
                //遍历列表，从树叶->树根的顺数找出递归路径，输出所有数字
                trace2TheSource(&node, sum, target);
            }
            sum -=  node.number;
            continue;
        }
//        if (sum == target) {
//            if (time == times) {
//                double number = node.number/100.00;
//                printf("%d个数相加情况: %.2f",times+1,number);
//                outputFile<<times+1<<"个数相加情况: "<<endl<<number<<endl;
//                //遍历列表，从树叶->树根的顺数找出递归路径，输出所有数字
//                trace2TheSource(&node,target);
//            }
//            sum -=  node.number;
//            continue;
//        }
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
void printArray(long *array,int count){
    for (int i=0; i<count; i++) {
        double number = array[i]/100.00;
        printf("%.2f, ",number);
    }
    printf("\n");
}

/** 对数组进行排序 */
void sortArray(long *array,int count){
    long temp;
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

/** 主函数 */
void Caculate(){
    // 1.初始化数据
    
    ifstream inputFile(MAC_PATH_I);
    long data[1000]; //用于保存读取出来的数字的数组
    int count = 0;
    while (!inputFile.eof()) {//将inf文件中的数字读取到data数组中
        double number;
        inputFile>>number;
        long y = number * 100;
        data[count] = y;
//        printf("%ld,",data[count]);
        count++;
    }
    inputFile.close(); //读取完毕后,关闭文件
    
    count--;//数组中最后一个数为总和
    
    long target = data[count];

    printf("原始数组内的数据为：\n");
    printArray(data, count);
    
    // 2.对数组进行排序
    sortArray(data,count);
    
    // 3.主算法
    double number = target/100.00;
    printf("固定和：%.2f\n",number);
    
    // 初始化链表,头结点
    ListNode header;
    header.number = 0;
    header.last = NULL;
    
    // 最少是两个数相加，最多的时候是所有的数字相加
//    for (int k=1; k < count; k++) {
    for (int k=12; k <= 12; k++) {
        Recursion(0, count-k, k, 0, data, count, 0, target, &header);
    }
}

int main(int argc, const char * argv[]) {
    outputFile.open(MAC_PATH_O); //创建一个文件
    Caculate();
    outputFile.close();
    return 0;
}
