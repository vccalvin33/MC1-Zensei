//
//  DetailCell.swift
//  MC1Draft
//
//  Created by Aghawidya Adipatria on 08/04/20.
//  Copyright © 2020 Aghawidya Adipatria. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    // MARK: PROPERTIES
    let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Content"
        //label.font = label.font.withSize(17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var content: String! {
        didSet {
            contentLabel.text = content
        }
    }
    
    // MARK: DEFAULT INITIALISATION
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: CELL CUSTOMISATION
    func setUpCell() {
        addSubview(contentLabel)
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: self.topAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
