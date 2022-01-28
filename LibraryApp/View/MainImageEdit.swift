//
//  MainImageEdit.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 11/23/21.
//

import UIKit

class MainImageEdit: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp(){
        self.layer.cornerRadius = self.frame.height/10
        self.layer.cornerRadius = self.frame.width/10
        self.layer.masksToBounds = true
    }

}
