//
//  MainButton.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 11/28/21.
//

import UIKit


class MainButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp(){
        self.layer.cornerRadius = self.frame.height/4
        self.layer.masksToBounds = true
        backgroundColor = UIColor.black
        self.setTitleColor(.red, for: .normal)
    }
    
}
