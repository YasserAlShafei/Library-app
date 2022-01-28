//
//  CustomMyCell.swift
//  JsonApp
//
//  Created by DM 05 on 10/12/19.
//  Copyright © 2019 DM 05. All rights reserved.
//

import UIKit


class CustomMyCellPosts: UITableViewCell {
        
    @IBOutlet weak var title :UILabel!
    @IBOutlet weak var body :UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
