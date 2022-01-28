//
//  SettingsVC.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 11/28/21.
//

import UIKit
import Firebase
import FirebaseAuth



class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // ..
        
    }
    
    
    
    /*
    @IBAction func SignOut(_ sender :Any){
        do {
            try FirebaseAuth.Auth.auth().signOut()
            
            //.. do Something
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "LoginVC") as! LoginVC
            performSegue(withIdentifier: "LoginVC", sender: nil)
        }
        catch {
            print("An error occurred")
        }
    }

    
    @objc private func logOUtTapped() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            .. do Something
        }
        catch {
            print("An error occurred")
        }
    }
    */
}
