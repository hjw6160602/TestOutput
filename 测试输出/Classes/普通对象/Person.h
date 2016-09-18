//
//  Person.h
//  测试输出
//
//  Created by shoule on 15/11/20.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Room,Car,Dog;

@interface Person : NSObject{
    @public
    NSString *_foo;
}
@property (nonatomic, copy) NSString *foo;

- (void)sleep;

- (void)eat;

@end
