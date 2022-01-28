//
//  Actor.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 11/24/21.
//

import Foundation
import UIKit


class Actor {
    var image :UIImage?
    var name :String = ""
    var date :String = ""
    
    init(image :UIImage, name :String, date :String) {
        self.image = image
        self.name = name
        self.date = date
    }
}
