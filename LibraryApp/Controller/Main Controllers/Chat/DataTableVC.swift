//
//  DataTableVC.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 11/23/21.
//

import UIKit



class DataTableVC: UIViewController {

    @IBOutlet weak var myTableView :UITableView!
    @IBOutlet weak var myCollectionView :UICollectionView!
    var actors :[Actor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ..
        myTableView.dataSource = self
        myCollectionView.dataSource = self
        
        actors.append(Actor(image: #imageLiteral(resourceName: "Conan"), name: "Conan", date: "1992"))
        actors.append(Actor(image: #imageLiteral(resourceName: "remi"), name: "rimy", date: "1997"))
        actors.append(Actor(image: #imageLiteral(resourceName: "lufi"), name: "luify", date: "1996"))
        actors.append(Actor(image: #imageLiteral(resourceName: "gambol"), name: "Gambule", date: "2015"))
        actors.append(Actor(image: #imageLiteral(resourceName: "ben"), name: "ben", date: "2014"))
        actors.append(Actor(image: #imageLiteral(resourceName: "spongebob"), name: "sponge", date: "2014"))
        actors.append(Actor(image: #imageLiteral(resourceName: "Conan"), name: "Conan", date: "1992"))
        actors.append(Actor(image: #imageLiteral(resourceName: "remi"), name: "rimy", date: "1997"))
        actors.append(Actor(image: #imageLiteral(resourceName: "lufi"), name: "luify", date: "1996"))
        actors.append(Actor(image: #imageLiteral(resourceName: "gambol"), name: "Gambule", date: "2015"))
        actors.append(Actor(image: #imageLiteral(resourceName: "ben"), name: "ben", date: "2014"))
        actors.append(Actor(image: #imageLiteral(resourceName: "spongebob"), name: "sponge", date: "2014"))

        myTableView.reloadData()
        myCollectionView.reloadData()
        
    }
}




extension DataTableVC :UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = MyCustomCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell") as! MyCustomCell
                
        let actor = actors[indexPath.row]
        cell.nameLbl.text = actor.name
        cell.ageLbl.text = actor.date
        cell.imgProfile.image = actor.image
                
        return cell
    }
}




extension DataTableVC :UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoriesCVC
        //cell.lbl.text = "item : \(indexPath.row)"
        let actor = actors[indexPath.row]
        cell.imageUser.image = actor.image
        
        return cell
    }
}
