//
//  Person.h
//  测试输出
//
//  Created by shoule on 15/11/20.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Room,Car,Dog;

@protocol PersonDelegate

@property (nonatomic, assign)int Sincerity;

@end

@interface Person : NSObject <PersonDelegate>{
//    @public
//    NSString *_foo;
}

@property (nonatomic, copy, readonly) NSString *foo;

- (void)sleep;

- (void)eat;

@end
