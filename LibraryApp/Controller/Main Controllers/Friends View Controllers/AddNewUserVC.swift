//
//  AddNewUserVC.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 11/28/21.
//

import UIKit
import FirebaseDatabase



class AddNewUserVC: UIViewController {

    @IBOutlet weak var nameTF :UITextField!
    @IBOutlet weak var ageTF :UITextField!
    private let database = Database.database().reference()
    var isEnterName :String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ..
        isEnterName = UserDefaults.standard.string(forKey: "nameUser") ?? ""
        
    }
    
    
    @IBAction func addNewUser() {
        guard let name = nameTF.text, !name.isEmpty,
              let age = ageTF.text, !age.isEmpty else {
                  createAlert(title: "Error", message: "Missing field data..")
                  return
        }
        let object :[String:String] = [
            "name": "\(name)",
            "age": "\(age)"
        ]
        database.child("\(isEnterName!)").child("user_\(Int.random(in: 0..<1000))").setValue(object)
        createAlert(title: "Sucess", message: "operation succeeded")
    }
    
    func createAlert(title :String, message :String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
