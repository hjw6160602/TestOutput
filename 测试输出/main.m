//
//  main.m
//  测试输出
//
//  Created by shoule on 15/5/15.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import "main.h"
#import "SubStringToIndex.h"
#import "NetworkTool.h"
#import "Person.h"
#import "Dog.h"


/** 将一个字符串中的所有英文逗号替换成中文逗号 */
void replaceCharacter(){
    NSMutableString *text = [NSMutableString stringWithString:@"和风抹茶栗子,1.2磅,Happy Birthday"];
    NSString * search = @",";
    for (int i = 0; i < text.length - search.length + 1; i++) {
        NSRange range = NSMakeRange(i, search.length);
        if ([[text substringWithRange:range] isEqualToString:search])
            [text replaceCharactersInRange:range withString:@"，"];
    }
    NSLog(@"%@",text);
}

void Charter2Integer(){
    NSString *text = @"sdf";
    NSInteger index = text.integerValue;
    NSLog(@"%ld",index);
}

void testFace(){
    int nums[4] = {10,20,30,40};
    int *p1 = nums;
    p1 = p1 + 1;
    *p1 = *p1 - 1;
    printf(" %d\n\n ", *p1);
}

void testSomething(){
    Dog *d = [Dog new];
    d->_age = 10;
    d->_name = @"";
    NSLog(@"%d",d->_age);
}

void faceExamOfSingleton(){
    __block NetworkTool *tool2;
    __block NetworkTool *tool3;
    __block NetworkTool *tool4;
    __block NetworkTool *tool5;
    __block NetworkTool *tool6;
    __block NetworkTool *tool7;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        tool2 = [[NetworkTool alloc]init];
        NSLog(@"tool2:%@",tool2);
        
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        tool3 = [[NetworkTool alloc]init];
        NSLog(@"tool3:%@",tool3);
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        tool4 = [[NetworkTool alloc]init];
        NSLog(@"tool4:%@",tool4);
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        tool5 = [[NetworkTool alloc]init];
        NSLog(@"tool5:%@",tool5);
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        tool6 = [[NetworkTool alloc]init];
        NSLog(@"tool6:%@",tool6);
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        tool7 = [[NetworkTool alloc]init];
        NSLog(@"tool7:%@",tool7);
    });
    //总结：如果在allocWithZone方法中没有调用dispath_once就会导致可能在多线程创建下的不同地址，导致其不为单粒
    
    [NSString copy];
    CFRunLoopRun();
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        testFace();
//        [p eat];
//        CFRunLoopRun();
    }
    return 0;
}





