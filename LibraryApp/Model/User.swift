//
//  User.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 11/28/21.
//

import Foundation


class User {
    var name :String = ""
    var age :String = ""
    
    init() {}
    
    init(name :String, age :String) {
        self.name = name
        self.age = age
    }
}
