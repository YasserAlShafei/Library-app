//
//  ViewController.swift
//  JsonApp
//
//  Created by DM 05 on 10/12/19.
//  Copyright © 2019 DM 05. All rights reserved.
//

import UIKit


struct Post {
    var title :String
    var body :String
}


class PostsVC: UIViewController {

    var arrPosts :[Post] = []
    var indexPost :Int = 0
    var postObj : Post? = nil
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.''
        getInfornation()
        table.dataSource = self
        table.delegate = self
    }
    
    
    
    func getInfornation (){
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/posts")!) { (data, response, error) in
            
            if error != nil {
                print(error.debugDescription)
            }else{
                print(data?.description)		
                do{
                    let arrayObject = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String:Any]]
                    for dic in arrayObject {
                        //let userId = dic["userId"] as! Int
                        let title = dic["title"] as! String
                        let body = dic["body"] as! String
                        self.arrPosts.append(Post(title: title, body: body))
                    }
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                    
                }catch let error {
                    print(error)
                }
            }
        }.resume()
    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowComment" {
//            let vc = segue.destination as! CommentsVC
//            vc.itemPost = sender as! PostsVC
//        }
//    }
    
}






extension PostsVC : UITableViewDataSource ,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomMyCellPosts") as! CustomMyCellPosts
        cell.title.text = arrPosts[indexPath.row].title
        cell.body.text = arrPosts[indexPath.row].body
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row, forKey: "index_post")
        self.indexPost = indexPath.row
        print("index post = \(indexPost)")
        self.postObj = self.arrPosts[indexPath.row]
        performSegue(withIdentifier: "ShowComment", sender: indexPost)
    }
}

