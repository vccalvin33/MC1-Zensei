//
//  NewDetailViewController.swift
//  Zensei
//
//  Created by Shendy Aditya Syamsudin on 13/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class NewDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var imgMeditation: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var dataDetail : Meditation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        imgMeditation.image = UIImage(named: dataDetail.icon)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = dataDetail.title
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2039215686, green: 0.3647058824, blue: 0.3058823529, alpha: 1)
        if #available(iOS 13, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = #colorLiteral(red: 0.8891196251, green: 0.8976630569, blue: 0.8601869941, alpha: 1)
            appearance.titleTextAttributes =  [.foregroundColor:#colorLiteral(red: 0.2039215686, green: 0.3647058824, blue: 0.3058823529, alpha: 1) ]
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2039215686, green: 0.3647058824, blue: 0.3058823529, alpha: 1)
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.2039215686, green: 0.3647058824, blue: 0.3058823529, alpha: 1)]
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath) as! DetailTableViewCell
        
        if indexPath.row == 0 {
            cell.iconDetail.image = #imageLiteral(resourceName: "ic-desc")
        }else{
            cell.iconDetail.image = #imageLiteral(resourceName: "ic-instruction")
        }
        
        cell.labelDesc.text = dataDetail.detail![indexPath.row].desc
        cell.labelDetail.text = dataDetail.detail![indexPath.row].title
        
        if dataDetail.detail![indexPath.row].isOpen {
            cell.imgChevron.image = UIImage(systemName: "chevron.down.circle")
            UIView.animate(withDuration: 0.4, animations: {
                cell.imgChevron.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)
            })
        }else{
            cell.imgChevron.image = UIImage(systemName: "chevron.down.circle")
            UIView.animate(withDuration: 0.4, animations: {
                cell.imgChevron.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
            })
        }
        
        return cell
    }
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if dataDetail.detail![indexPath.row].isOpen {
            dataDetail.detail![indexPath.row].isOpen = false
        }else{
            dataDetail.detail![indexPath.row].isOpen = true
        }
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if dataDetail.detail![indexPath.row].isOpen {
            return UITableView.automaticDimension
        }else{
            return 80
        }
    }
    
}
