//
//  FaceExam.h
//  测试输出
//
//  Created by shoule on 15/10/9.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FaceExam : NSObject

/** 贝思客笔试题目:找错 */
+ (void)test1;
+ (void)test2;
+ (void)test3:(char *)str1;

+ (void)AppendString;
+ (id)initWithCString:(char *)nullTerminatedCString encoding: (NSStringEncoding)encoding;
@end
