//
//  CheckListTableViewCell.swift
//  CheckLists
//
//  Created by Mostafa El_sayed on 4/17/17.
//  Copyright © 2017 Mostafa El_sayed. All rights reserved.
//

import UIKit

class CheckListTableViewCell: UITableViewCell {

    @IBOutlet var listLabel:UILabel!
    @IBOutlet weak var checkMarkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        listLabel.text = ""
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
