//
//  ViewController.swift
//  Zensei
//
//  Created by Shendy Aditya Syamsudin on 07/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    //dcdfd3
    //345d4e
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.hideBottomHairline()
        if #available(iOS 13, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = #colorLiteral(red: 0.8891196251, green: 0.8976630569, blue: 0.8601869941, alpha: 1)
            appearance.titleTextAttributes =  [.foregroundColor: UIColor.white]
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8891196251, green: 0.8976630569, blue: 0.8601869941, alpha: 1)
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellRecomend", for: indexPath) as! RecomendedTVCell
            return cell
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellMeditation", for: indexPath) as! MeditationTVCell
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellSound", for: indexPath) as! SoundTVCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if let cell = cell as? RecomendedTVCell {
                cell.arrayRecomended = MenuData.getRecomended()
                cell.collectionView.reloadData()
                
            }
        }else if indexPath.row == 1{
            if let cell = cell as? MeditationTVCell {
                cell.arrayMeditation = MenuData.getMeditation()
                cell.collectionView.reloadData()
                
            }
        }else{
            if let cell = cell as? SoundTVCell {
                cell.arraySound = MenuData.getSound()
                cell.collectionView.reloadData()
                
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    //Ke Menu Profile
    @IBAction func didTapProfileMenu(_ sender: Any) {
        //Ke Detail
        // let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "storyBoardID") as! NamaController
        // self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

