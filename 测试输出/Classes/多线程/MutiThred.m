//
//  MutiThred.m
//  测试输出
//
//  Created by shoule on 15/10/12.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import "MutiThred.h"


@implementation MutiThred

- (void)ThredRun{
    // 默认有100张
    self.leftTicketsCount = 100;
    
    // 开启多条线程同时卖票
    self.thread0 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread0.name = @"售票员 A";
    //    self.thread0.threadPriority = 0.0;
    
    self.thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread1.name = @"售票员 B";
    //    self.thread1.threadPriority = 1.0;
    
    self.thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread2.name = @"售票员 C";
    //    self.thread2.threadPriority = 0.0;
    [self.thread0 start];
    [self.thread1 start];
    [self.thread2 start];
//  主线程睡眠2秒 不然不会执行子线程
    sleep(2);
}


/**
 * 卖票
 */
- (void)saleTicket
{
    while (1) {
        @synchronized(self) { // 加锁(只能用一把锁)
            // 1.先检查票数
            int count = self.leftTicketsCount;
            if (count > 0) {
                // 暂停
                //                [NSThread sleepForTimeInterval:0.0002];
                
                // 2.票数 - 1
                self.leftTicketsCount = count - 1;
                
                NSThread *current = [NSThread currentThread];
                NSLog(@"%@ 卖了一张票, 剩余%d张票", current.name, self.leftTicketsCount);
            } else {
                // 退出线程
                [NSThread exit];
            }
        } // 解锁
    }
}

@end
