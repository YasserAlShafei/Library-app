//
//  FriendsVC.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 11/28/21.
//

import UIKit
import FirebaseDatabase


class FriendsVC: UITableViewController {

    var users :[User]  = []
    private let database = Database.database().reference()
    var isEnterName :String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ..
        isEnterName = UserDefaults.standard.string(forKey: "nameUser") ?? ""

        self.tableView.register(UINib(nibName: "UserDetailsTVC", bundle: .main), forCellReuseIdentifier: "UserDetailsTVC")
        
        database.child("\(isEnterName!)").observe(.value, with: { snapshot in
            if snapshot.value != nil {
                self.users.removeAll()
                for child in snapshot.children {
                    let user = User()
                    let childSnapshot = child as! DataSnapshot
                    if childSnapshot.hasChild("age"){
                        user.age = childSnapshot.childSnapshot(forPath: "age").value as! String
                    }
                    if childSnapshot.hasChild("name"){
                        user.name = childSnapshot.childSnapshot(forPath: "name").value as! String
                    }
                    
                    self.users.append(user)
                }
                self.tableView.reloadData()
            }
        })
    }
    
    

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailsTVC", for: indexPath) as? UserDetailsTVC
        let user = users[indexPath.row]
        cell?.nameLbl.text = user.name
        cell?.ageLbl.text = "\(user.age)"
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        if editingStyle == .delete {
            users.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
