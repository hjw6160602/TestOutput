//
//  MutiThred.h
//  测试输出
//
//  Created by shoule on 15/10/12.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MutiThred : NSObject

/** 剩余票数 */
@property (nonatomic, assign) int leftTicketsCount;

@property (nonatomic, strong) NSThread *thread0;
@property (nonatomic, strong) NSThread *thread1;
@property (nonatomic, strong) NSThread *thread2;

- (void)ThredRun;

@end
