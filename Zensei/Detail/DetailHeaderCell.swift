//
//  DetailHeaderCell.swift
//  MC1Draft
//
//  Created by Aghawidya Adipatria on 08/04/20.
//  Copyright © 2020 Aghawidya Adipatria. All rights reserved.
//

import UIKit

class DetailHeaderCell: UITableViewCell {

    // MARK: PROPERTIES
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Header"
        //label.font = label.font.withSize(25)
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let expandButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        return button
    }()
    
    var isExpanded = true
    var expandDescription : (() -> ()) = {}
    
    var title: String! {
        didSet {
            headerLabel.text = title
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
        setUpAccessory()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: CELL CUSTOMISATION
    func setUpCell() {
        addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func setUpAccessory() {
        expandButton.addTarget(self, action: #selector(expandButtonPressed), for: .touchUpInside)
        accessoryView = expandButton
    }
    
    @objc func expandButtonPressed() {
        if isExpanded {
            expandButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        } else {
            expandButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }
        
        expandDescription()
        isExpanded = !isExpanded
    }
}
