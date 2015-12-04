//
//  Plugins.h
//  测试输出
//
//  Created by shoule on 15/12/4.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Plugins : NSObject
/** 所有的数字组成的数组 */
@property (nonatomic, strong) NSArray* array;
/** 其中某几个数字的总和*/
@property (nonatomic, assign) float sum;

- (void)Calulate:(float)sum Array:(NSArray*)array;
@end
