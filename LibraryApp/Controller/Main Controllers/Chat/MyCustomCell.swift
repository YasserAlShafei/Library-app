//
//  MyCustomCell.swift
//  Day_16_TableView
//
//  Created by Abdullah Ayyad on 21/09/2019.
//  Copyright © 2019 Abdullah Ayyad. All rights reserved.
//

import UIKit



class MyCustomCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
