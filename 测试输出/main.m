//
//  main.m
//  测试输出
//
//  Created by shoule on 15/5/15.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import "main.h"
#import "SubStringToIndex.h"

/** 字符串换行拼接 */
void test(){
    NSArray *Arr = @[@"极地牛乳2.2磅：生日快乐",@"和风抹茶栗子：1.2磅：Happy Birthday"];
    NSString *text = @"";
    for (NSString *info in Arr) {
        text = [text stringByAppendingString:info];
        text = [text stringByAppendingString:@"\n"];
    }
    NSLog(@"%@",text);
}

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
    p1--;
    printf(" %d\n\n ", *p1);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        testFace();
    }
    return 0;
}





