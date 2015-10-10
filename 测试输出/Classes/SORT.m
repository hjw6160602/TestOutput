//
//  SORT.m
//  测试输出
//
//  Created by shoule on 15/10/10.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import "SORT.h"

@implementation SORT

+ (void)sortDictionary{
    // 1.定义一个测试的字典数组
    NSArray *dictArray = @[
                                  @{
                                      @"FEnabled" : [NSNumber numberWithInt:1],
                                      @"FGroupTag" : [NSNumber numberWithInt:0],
                                      @"FOrder" : [NSNumber numberWithInt:0],
                                      @"FName" : @"宝玉"
                                      },
                                  @{
                                      @"FEnabled" : [NSNumber numberWithInt:1],
                                      @"FGroupTag" : [NSNumber numberWithInt:1],
                                      @"FOrder" : [NSNumber numberWithInt:0],
                                      @"FName" : @"黛玉"
                                      },
                                  @{
                                      @"FEnabled" : [NSNumber numberWithInt:0],
                                      @"FGroupTag" : [NSNumber numberWithInt:1],
                                      @"FOrder" : [NSNumber numberWithInt:1],
                                      @"FName" : @"宝钗"
                                      },
                                  @{
                                      @"FEnabled" : [NSNumber numberWithInt:1],
                                      @"FGroupTag" : [NSNumber numberWithInt:1],
                                      @"FOrder" : [NSNumber numberWithInt:2],
                                      @"FName" : @"湘云"
                                      },
                                  @{
                                      @"FEnabled" : [NSNumber numberWithInt:1],
                                      @"FGroupTag" : [NSNumber numberWithInt:2],
                                      @"FOrder" : [NSNumber numberWithInt:0],
                                      @"FName" : @"妙玉"
                                      },
                                  @{
                                      @"FEnabled" : [NSNumber numberWithInt:1],
                                      @"FGroupTag" : [NSNumber numberWithInt:3],
                                      @"FOrder" : [NSNumber numberWithInt:0],
                                      @"FName" : @"晴雯"
                                      },
                                  @{
                                      @"FEnabled" : [NSNumber numberWithInt:1],
                                      @"FGroupTag" : [NSNumber numberWithInt:3],
                                      @"FOrder" : [NSNumber numberWithInt:1],
                                      @"FName" : @"袭人"
                                      }
                                  
                                  ];
    // NSArray 转成 NSMutableArray
    // 0、对于不启用的,即enabled为0的字典模型,删除掉
    NSMutableArray *dictArr = [NSMutableArray array];
    for (int i = 0; i < dictArray.count; i++) {
        NSDictionary *dict = dictArray[i];
        if ([[dict objectForKey:@"FEnabled"]intValue] == 1) {
            [dictArr addObject:dict];
        }
    }
    // NSLog(@"清除未启用的字典后的数组:%@",dictArr);
    
    // 1、对数组按GroupTag排序
    NSArray *sortDesc = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"FGroupTag" ascending:YES]];
    NSArray *sortedArr = [dictArr sortedArrayUsingDescriptors:sortDesc];
    // NSLog(@"排序后的数组:%@",sortedArr);
    
    
    // 2、对数组进行分组，按GroupTag
    // 遍历,创建组数组,组数组中的每一个元素是一个模型数组
    NSMutableArray *_groupArr = [NSMutableArray array];
    NSMutableArray *currentArr = [NSMutableArray array];
    NSLog(@"class--%@",[currentArr class]);
    // 因为肯定有一个字典返回,先添加一个
    [currentArr addObject:sortedArr[0]];
    [_groupArr addObject:currentArr];
    // 如果不止一个,才要动画添加
    if(sortedArr.count > 1){
        for (int i = 1; i < sortedArr.count; i++) {
            // 先取出组数组中  上一个模型数组的第一个字典模型的groupID
            NSMutableArray *preModelArr = [_groupArr objectAtIndex:_groupArr.count-1];
            int preGroupID = [[[preModelArr objectAtIndex:0] objectForKey:@"FGroupTag"] intValue];
            // 取出当前字典,根据groupID比较,如果相同则添加到同一个模型数组;如果不相同,说明不是同一个组的
            NSDictionary *currentDict = sortedArr[i];
            int groupID = [[currentDict objectForKey:@"FGroupTag"] intValue];
            if (groupID == preGroupID) {
                [currentArr addObject:currentDict];
            }else{
                // 如果不相同,说明 有新的一组,那么创建一个模型数组,并添加到组数组_groupArr
                currentArr = [NSMutableArray array];
                [currentArr addObject:currentDict];
                [_groupArr addObject:currentArr];
            }
        }
    }
    // 3、遍历 对每一组 进行排序
    NSMutableArray *tempGroupArr = [NSMutableArray array];
    for (NSMutableArray *arr in _groupArr) {
        NSArray *sortDesc = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"FOrder" ascending:YES]];
        NSLog(@"%@",sortDesc);
        NSArray *tempArr = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            if([[obj1 objectForKey:@"FOrder"]intValue] < [[obj2 objectForKey:@"FOrder"]intValue]){
                return NSOrderedAscending;
            }
            if([[obj1 objectForKey:@"FOrder"]intValue] > [[obj2 objectForKey:@"FOrder"]intValue]){
                return NSOrderedDescending;
            }
            return NSOrderedSame;
        }];
        [tempGroupArr addObject:tempArr];
    }
    _groupArr = tempGroupArr;
    
    NSLog(@"封装好的group数组:%@",_groupArr);
}


@end
