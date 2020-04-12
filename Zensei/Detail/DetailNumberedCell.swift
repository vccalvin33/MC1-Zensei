//
//  DetailNumberedCell.swift
//  MC1Draft
//
//  Created by Aghawidya Adipatria on 09/04/20.
//  Copyright © 2020 Aghawidya Adipatria. All rights reserved.
//

import UIKit

class DetailNumberedCell: UITableViewCell {
    
    // MARK: PROPERTIES
    let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Content"
        //label.font = label.font.withSize(17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "1."
        label.textAlignment = .right
        //label.font = label.font.withSize(17)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var content: String! {
        didSet {
            contentLabel.text = content
        }
    }
    
    var number: Int! {
        didSet {
            numberLabel.text = "\(number as Int)."
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
        addSubview(numberLabel)
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: self.topAnchor),
            numberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            numberLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 25),
            contentLabel.topAnchor.constraint(equalTo: self.topAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            contentLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 8),
            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
