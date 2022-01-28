//
//  EditDataBookVC.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 11/30/21.
//

import UIKit
import CoreData



class EditDataBookVC: UIViewController {

    var context :NSManagedObjectContext?
    var delegate :AppDelegate?
    @IBOutlet weak var nameTF :UITextField!
    @IBOutlet weak var authorTF :UITextField!
    var book :Book?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        delegate = (UIApplication.shared.delegate as! AppDelegate)
        context = delegate?.persistentContainer.viewContext
        
        self.title = book?.name
        nameTF.text = book?.name
        authorTF.text = book?.author
    }
    
    
    
    @IBAction func editStudent(_ sender :Any) {
        book?.name = nameTF.text!
        book?.author = authorTF.text!
        delegate?.saveContext()
        self.navigationController?.popViewController(animated: true)
    }
    
}
