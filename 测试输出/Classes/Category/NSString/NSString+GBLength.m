//
//  NSString+GBLength.m
//  测试输出
//
//  Created by shoule on 15/5/15.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import "NSString+GBLength.h"

@implementation NSString (GBLength)

+ (int)GBLength:(NSString*)strtemp{
    int strlength = 0;
    // 一定要使用gbk的编码方式
    NSStringEncoding gbkEncoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    char* p = (char*)[strtemp cStringUsingEncoding:gbkEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:gbkEncoding] ;i++) {
        if (p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
}


@end
