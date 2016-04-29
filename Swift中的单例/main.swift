//
//  main.swift
//  Swift中的单例
//
//  Created by shoule on 16/4/29.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

import Foundation

let user1 = UserModel.sharedUserModel()
print(user1)
user1.Id = "44100"
print(user1.Id)

let user2 = UserModel.sharedUserModel()
print(user2)
print(user2.Id)

let user3 = UserModel()
print(user3)
print(user3.Id)

let user4 = UserModel()
print(user4)
print(user4.Id)

let p1 = Person.sharedPerson()
p1.name = "Jack"
print(p1)
print(p1.name)

let p2 = Person.sharedPerson()
print(p2)
print(p2.name)

let p3 = Person()
print(p3)
print(p3.name)





