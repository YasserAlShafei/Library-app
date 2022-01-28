//
//  UiViewController.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 11/28/21.
//

import UIKit


extension UIViewController {
    
    func isLogin() {
        let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        if !isLogin {
            loginPageEx()
        }else if (isLogin) {
            mainPageEx()
        }
    }
    
    func loginPageEx() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "LoginVC") as! LoginVC
        self.present(vc, animated: false, completion: nil) 
    }
    
    func mainPageEx() {
        let storyboard = UIStoryboard(name: "Data", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "MainVC") as! MainVC
        self.present(vc, animated: false, completion: nil)
    }
    
    
    @IBAction func logOut() {
        UserDefaults.standard.removeObject(forKey: "isLogin")
        UserDefaults.standard.removeObject(forKey: "nameUser")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "LoginVC") as! LoginVC
        self.present(vc, animated: true, completion: nil)
    }
}
