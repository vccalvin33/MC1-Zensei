//
//  SoundTVCell.swift
//  Zensei
//
//  Created by Shendy Aditya Syamsudin on 12/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class SoundTVCell: UITableViewCell,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var arraySound = [Meditation]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arraySound.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionSound", for: indexPath) as! SoundCVCell
        if arraySound.count != 0 {
            let menu = arraySound[indexPath.row]
            cell.labelTitle.text = menu.title
            cell.imgBG.image = UIImage(named: menu.icon)
            cell.imgType.image = UIImage(systemName: "music.note")
          
        }
        
        cell.backgroundColor = UIColor.gray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        //Ke Detail
        //               let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "storyBoardID") as! NamaController
        //               self.viewController()?.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? SoundCVCell {
                cell.mask?.transform = .init(scaleX: 0.95, y: 0.95)
                cell.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? SoundCVCell {
                cell.mask?.transform = .identity
                cell.contentView.backgroundColor = .clear
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width: 200, height:((screenWidth/3)))
        
        
    }
    
}
