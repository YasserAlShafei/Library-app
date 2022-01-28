//
//  SectionsVC.swift
//  Authenticate Using Email
//
//  Created by Yasser Al-ShaFei on 11/30/21.
//

import UIKit


class SectionsVC: UIViewController {

    var cells :[Cell] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ..
        let width = (view.frame.size.width - 47) / 2
        
        let layoyt = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layoyt.itemSize = CGSize(width: width, height: width)
        collectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        cells.append(Cell(image: #imageLiteral(resourceName: "img1"), address: "Cooking", color: #colorLiteral(red: 0.9203684926, green: 0.4084154367, blue: 0.3209894896, alpha: 1), image2: #imageLiteral(resourceName: "i1.png")))
        cells.append(Cell(image: #imageLiteral(resourceName: "img2"), address: "Physics", color: #colorLiteral(red: 0.8470588235, green: 0.2235294118, blue: 0.3921568627, alpha: 1), image2: #imageLiteral(resourceName: "i2.png")))
        cells.append(Cell(image: #imageLiteral(resourceName: "img3"), address: "Math", color: #colorLiteral(red: 0.5647058824, green: 0.2156862745, blue: 0.6666666667, alpha: 1), image2: #imageLiteral(resourceName: "i3.png")))
        cells.append(Cell(image: #imageLiteral(resourceName: "img4"), address: "Technology", color: #colorLiteral(red: 0.3725490196, green: 0.2549019608, blue: 0.6901960784, alpha: 1), image2: #imageLiteral(resourceName: "i5.png")))
        cells.append(Cell(image: #imageLiteral(resourceName: "img1"), address: "Cooking", color: #colorLiteral(red: 0.2470588235, green: 0.3254901961, blue: 0.6823529412, alpha: 1), image2: #imageLiteral(resourceName: "i1.png")))
        cells.append(Cell(image: #imageLiteral(resourceName: "img2"), address: "Physics", color: #colorLiteral(red: 0.2549019608, green: 0.5882352941, blue: 0.9254901961, alpha: 1), image2: #imageLiteral(resourceName: "i2.png")))
        cells.append(Cell(image: #imageLiteral(resourceName: "img3"), address: "Math", color: #colorLiteral(red: 0.3058823529, green: 0.7294117647, blue: 0.8196078431, alpha: 1), image2: #imageLiteral(resourceName: "i3.png")))
        cells.append(Cell(image: #imageLiteral(resourceName: "img4"), address: "Technology", color: #colorLiteral(red: 0.2431372549, green: 0.5764705882, blue: 0.5333333333, alpha: 1), image2: #imageLiteral(resourceName: "i5.png")))
        
    }
    
}




extension SectionsVC :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCVC", for: indexPath) as! CustomCVC
        
        cell.address.text = cells[indexPath.row].address
         cell.view.backgroundColor = cells[indexPath.row].color
         cell.image.image = cells[indexPath.row].image
        cell.image2.image = cells[indexPath.row].image2

        return cell
    }
}
