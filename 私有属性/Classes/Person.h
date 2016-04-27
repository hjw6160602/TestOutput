//
//  Person.h
//  测试输出
//
//  Created by shoule on 16/4/19.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    
    @public
    NSString *_Face;
    
    @protected
    
    NSString *_Money;
    
    @private
    NSString *_Size;
}

@property (nonatomic, strong) NSString *Other;
//
//@protected
//@property (nonatomic, strong) NSString *Face;
//
//@private
//@property (nonatomic, strong) NSString *Face;

@end
