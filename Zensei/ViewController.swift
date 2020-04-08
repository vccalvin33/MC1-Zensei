//
//  ViewController.swift
//  Zensei
//
//  Created by Shendy Aditya Syamsudin on 07/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        if indexPath.row == 0 {
            return  cell
            
        }else if indexPath.row == 1 {
            return  cell
            
        }else{
            return cell
        }
    }
    
    
    
}

