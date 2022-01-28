//
//  MyCellCommentTableViewCell.swift
//  JsonApp
//
//  Created by mac on 10/12/19.
//  Copyright © 2019 DM 05. All rights reserved.
//

import UIKit

class CustomMyCellComments: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
