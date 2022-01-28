//
//  SourceTC.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 11/8/21.
//

import UIKit




class SourceTC: UITabBarController {

    var data :String = "Ahmed"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let finalVC = self.viewControllers![0] as! MainVC //first view controller in the tabbar
        finalVC.result = data
        
        let nameUser = UserDefaults.standard.string(forKey: "nameUser") ?? ""
        print("name is \(nameUser)")
        if (nameUser != nil) {
            finalVC.result = "\(nameUser)"
        }
        
    }
}

