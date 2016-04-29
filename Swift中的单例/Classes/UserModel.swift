//
//  UserModel.swift
//  测试输出
//
//  Created by shoule on 16/4/29.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

import Foundation

class UserModel: NSObject {
    /** 用户ID */
    var Id: String          = ""

    static let instance:UserModel = UserModel()
    
    /// 获取单粒的方法
    class func sharedUserModel() -> UserModel {
        return instance
    }
}
