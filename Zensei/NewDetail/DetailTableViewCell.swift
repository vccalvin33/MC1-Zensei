//
//  DetailTableViewCell.swift
//  Zensei
//
//  Created by Shendy Aditya Syamsudin on 13/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var iconDetail: UIImageView!
    @IBOutlet weak var labelDetail: UILabel!
    @IBOutlet weak var labelDesc: UITextView!
    @IBOutlet weak var imgChevron: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
