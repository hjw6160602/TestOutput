//
//  NetworkTool.m
//  测试输出
//
//  Created by shoule on 16/10/11.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "NetworkTool.h"

@implementation NetworkTool

static NetworkTool *_instance;

#pragma mark - Singleton
+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
//    if (_instance == nil) {
//        _instance = [super allocWithZone:zone];
//    }
    return _instance;
}

+ (instancetype)sharedTool
{
    if (_instance == nil) {
        _instance = [[NetworkTool alloc]init];
    }
    return _instance;
}

- (id)copyWithZone:(nullable NSZone *)zone{
    return _instance;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone{
    return _instance;
}


@end
