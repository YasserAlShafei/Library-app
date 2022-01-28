//
//  PostsTableVC.swift
//  JsonApp
//
//  Created by mac on 10/12/19.
//  Copyright © 2019 DM 05. All rights reserved.
//

import UIKit


struct Comment {
    var postId :Int
    var email :String
    var body :String
}


class CommentsVC: UIViewController {
    
    @IBOutlet weak var tableComments :UITableView!
    var itemPost :PostsVC?
    var indexComment :Int = 0
    var arrComments :[Comment] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfornation()
        tableComments.dataSource = self
    }
    
    
    
    func getInfornation (){
        let nameUser = UserDefaults.standard.integer(forKey: "index_post")
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(nameUser)")!) { (data, response, error) in
            
            if error != nil {
                print(error.debugDescription)
            }else{
                print(data?.description)
                do{
                    let arrayObject = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String:Any]]
                    for dic in arrayObject {
                        let postId = dic["postId"] as! Int
                        let email = dic["email"] as! String
                        let body = dic["body"] as! String
                        self.arrComments.append(Comment(postId: postId, email: email, body: body))
                        }
                        DispatchQueue.main.async {
                            self.tableComments.reloadData()
                        }
                }catch let error {
                    print(error)
                }
            }
        }.resume()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowComment" , let vc = segue.destination as? CommentsVC {
//            vc.delegate = self
//        }
//    }
}





extension CommentsVC :UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellComment") as! CustomMyCellComments
        
        cell.emailLabel?.text = arrComments[indexPath.row].email
        cell.bodyLabel?.text = arrComments[indexPath.row].body
        
        return cell
    }
}




