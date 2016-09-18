//
//  main.m
//  测试输出
//
//  Created by shoule on 15/5/15.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import "main.h"
#import "SubStringToIndex.h"
#import "Person.h"


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


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [Person new];
        [p eat];
        CFRunLoopRun();
    }
    return 0;
}





