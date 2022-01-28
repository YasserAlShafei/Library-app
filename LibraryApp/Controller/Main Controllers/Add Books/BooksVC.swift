//
//  RedVC.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 11/10/21.
//

import UIKit
import CoreData


class BooksVC: UIViewController {

    var context :NSManagedObjectContext?
    var delegate :AppDelegate?
    var books :[Book] = []
    @IBOutlet weak var nameTF :UITextField!
    @IBOutlet weak var authorTF :UITextField!
    @IBOutlet weak var versionTF :UITextField!
    @IBOutlet weak var tableBooks :UITableView!
    var name :String?
    var author :String?
    var version :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // ..
        delegate = (UIApplication.shared.delegate as! AppDelegate)
        context = delegate?.persistentContainer.viewContext
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        books = getAllBooks()
        tableBooks.reloadData()
    }
    
    @IBAction func addBook() {
        name = nameTF?.text?.description
        author = authorTF?.text?.description
        version = versionTF?.text!.description
        
        if name != "" && author != "" && version != "" {
            let s = Book(context: context!)
            s.name = nameTF.text
            s.author = authorTF.text
            delegate?.saveContext()
            
            books = getAllBooks()
            tableBooks.reloadData()
        } else {
            createAlert(title: "Error", message: "Miss Data Enter..")
        }
    }
    
    func getAllBooks() -> [Book] {
        do {
            return try context?.fetch(Book.fetchRequest()) as! [Book]
        } catch {
            print("Book not Found")
        }
        return []
    }
    
    func createAlert(title :String, message :String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditDataBookVC" {
            let vc = segue.destination as! EditDataBookVC
            vc.book = sender as! Book
        }
    }
}






extension BooksVC :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let book = books[indexPath.row]
        cell.textLabel!.text = "\(book.name!)"
        cell.detailTextLabel!.text = "\(book.author!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = books[indexPath.row]
        performSegue(withIdentifier: "EditDataBookVC", sender: book)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let book = books[indexPath.row]
        if editingStyle == .delete {
            context?.delete(book)
            delegate?.saveContext()
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
