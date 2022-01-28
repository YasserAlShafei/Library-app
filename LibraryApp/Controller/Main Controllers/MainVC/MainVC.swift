//
//  SecondVC.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 11/7/21.
//

import UIKit




class MainVC: UIViewController ,UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label :UILabel!
    @IBOutlet weak var lbl_DOB: UILabel!
    var result :String = "Hello"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ..
        label.text = "Hi \(result)"
        
        let isLogin = UserDefaults.standard.bool(forKey: "name")
        if isLogin {
            label.text = "Hi \(result)"
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM EEEE dd/MM/YYYY"
        lbl_DOB.text = formatter.string(from: Date())
        
    }
    
    
    
    
    
    @IBAction func pickImage(_ sender: Any) {
        let alert = UIAlertController(title: "title", message: "this is message", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "photo library", style: .default) { action in
            self.getImage(sourceType: .photoLibrary)
        })
        alert.addAction(UIAlertAction(title: "camera", style: .default) { action in
            self.getImage(sourceType: .camera)
        })
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    
    /*
    @IBAction func showAleart(_ sender: Any) {
        let alert = UIAlertController(title: "Title", message: "this is message", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel) { action in
            print("hi")
        })
        alert.addAction(UIAlertAction(title: "delete", style: .destructive, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    */
    
    
    @IBAction func chooseImage(_ sender: Any) {
        let alert = UIAlertController(title: "Title", message: "Choose Image", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Photo library", style: .default) { action in
            self.getImage(sourceType: .photoLibrary)
        })
        alert.addAction(UIAlertAction(title: "Camera", style: .default) { action in
            self.getImage(sourceType: .camera)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func getImage(sourceType : UIImagePickerController.SourceType){
                if !UIImagePickerController.isSourceTypeAvailable(sourceType) {
                        showMessage(title:  "error", message: "Source type 1 not available")
                        return
                    }
        let picker = UIImagePickerController()
                    picker.sourceType = sourceType
                    picker.delegate = self
                    picker.allowsEditing = true
            
                    self.present(picker, animated: true, completion: nil)
    }
    
    
    func showMessage(title :String, message :String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func shareText(_ sender : Any){
        let sherer = UIActivityViewController(activityItems: ["This is my text to share"], applicationActivities: [])
        present(sherer, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else{
            return
        }
        
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
}




