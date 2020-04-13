//
//  ProgressCellTableViewCell.swift
//  Mini Challenge 1 - 11
//
//  Created by Vincentius Calvin on 08/04/20.
//  Copyright © 2020 Vincentius Calvin. All rights reserved.
//

import UIKit

class ProgressCell: UITableViewCell {

    @IBOutlet weak var progressDay: UILabel!
    @IBOutlet weak var progressTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

