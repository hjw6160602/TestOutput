//
//  Dog.h
//  测试输出
//
//  Created by shoule on 15/11/20.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
    @public
    int _age;
    NSString *_name;
}
@property (nonatomic, copy, readonly) NSString *foo;

@end
