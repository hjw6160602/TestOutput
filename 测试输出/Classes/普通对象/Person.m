//
//  Person.m
//  测试输出
//
//  Created by shoule on 15/11/20.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import "Person.h"
#import "Room.h"
#import "Car.h"
#import "Dog.h"

@interface Person()
@property (nonatomic, retain) Room *room;
@end

@implementation Person

- (void)eat{
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fire) userInfo:nil repeats:YES];
}

- (void)fire{
    NSLog(@"吃..");
}

- (void)meditation{
    NSLog(@"meditation");
}

- (void)sleep{
    NSLog(@"sleep");
}

@end
