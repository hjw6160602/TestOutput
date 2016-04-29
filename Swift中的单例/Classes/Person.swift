//
//  Person.swift
//  测试输出
//
//  Created by shoule on 16/4/29.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

import Foundation

class Person: NSObject {
    var name:String = ""
    
    class func sharedPerson()-> Person{
        struct PersonStruct{
            static var predicate:dispatch_once_t = 0
            static var instance:Person? = nil
        }
        
        dispatch_once(&PersonStruct.predicate, {
            PersonStruct.instance = Person()
        })
        
        return PersonStruct.instance!
    }

}
