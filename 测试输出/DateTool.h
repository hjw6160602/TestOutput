//
//  DateTool.h
//  测试输出
//
//  Created by shoule on 15/7/31.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateTool : NSObject

+ (NSArray *)dateArray:(NSString *)startDate EndDate:(NSString *)endDate;
+ (NSDate *)getPriousDateFromDate:(NSDate *)date withMonth:(int)month;

@end
