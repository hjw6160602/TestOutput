//
//  SubStringToIndex.m
//  测试输出
//
//  Created by shoule on 16/4/27.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "SubStringToIndex.h"
#import "NSString+GBLength.h"

@implementation SubStringToIndex

static NSInteger MaxByteCount = 16;

/** SubStringToIndex 崩溃*/
+ (void)test{
    NSString * aString = @"我想对待a生活水平的";
    NSLog(@"%ld",aString.length);

    NSInteger length = 0;
    // 一定要使用gbk的编码方式
    NSStringEncoding gbkEncoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    char* p = (char*)[aString cStringUsingEncoding:gbkEncoding];
    
    NSInteger tempLength = [aString lengthOfBytesUsingEncoding:gbkEncoding];
    char newChar[MaxByteCount];
    
    for (NSInteger i=0 ; i< tempLength ;i++) {
        if (i < MaxByteCount) {
            newChar[i] = *p;
//            printf("%s\n", p);
        }
        if (p) {
            p++;
            length++;
        }
        else {
            p++;
        }
    }
    printf("%s\n",newChar);
    
    NSString * bString = [NSString stringWithCString:newChar  encoding:gbkEncoding];
    
    NSLog(@"%@",bString);
    
    NSLog(@"%ld",length);
    
    if (length > 16) {
        NSLog(@"昵称不能超过16个字符！");
//        NSString * bString = [[aString substringToIndex:15] copy];
        NSLog(@"%@",bString);
    }
}


+ (void)DeleteMutableString {
    NSMutableString *a = [[NSMutableString  alloc]initWithString:@",,我是你也来,,,,我是真的很累,,,我是真的很累,,"];
    //查找全部匹配的，并替换
    NSString *search = @",,";
    NSString *replace = @",";
    
    NSRange range  = [a rangeOfString:search];
    
    while (range.location != NSNotFound) {
        [a replaceCharactersInRange:range withString:replace];
        range = [a rangeOfString:search];
    }
    NSLog (@"%p,%@",&a, a);
    if ([a hasPrefix:replace]) {
        a = [[a substringFromIndex:1] mutableCopy];
        NSLog (@"%p,%@",&a, a);
    }
    if ([a hasSuffix:replace]) {
        a = [[a substringToIndex:a.length-1] mutableCopy];
        NSLog (@"%p,%@",&a, a);
    }
}

@end
