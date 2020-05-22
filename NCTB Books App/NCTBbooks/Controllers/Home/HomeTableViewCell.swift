//
//  HomeTableViewCell.swift
//  TabBarWithHomeListProfile
//
//  Created by Admin on 2/23/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    let imageAlita: [UIImage] = [
        UIImage(named: "alita01")!,
        UIImage(named: "alita02")!,
        UIImage(named: "alita03")!,
        UIImage(named: "alita04")!
    ]
    let imageIronman: [UIImage] = [
        UIImage(named: "ironman-1")!,
        UIImage(named: "ironman-2")!,
        UIImage(named: "ironman-3")!,
        UIImage(named: "ironman-4")!,
        UIImage(named: "ironman-5")!
    ]
    let imageSuperman: [UIImage] = [
        UIImage(named: "supermen-1")!,
        UIImage(named: "supermen-2")!,
        UIImage(named: "supermen-3")!,
        UIImage(named: "supermen-4")!
    ]
    let imageBatman: [UIImage] = [
        UIImage(named: "batman-2")!,
        UIImage(named: "batman-3")!,
        UIImage(named: "batman-4")!,
        UIImage(named: "batman-5")!
        
    ]
    
    override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
           homeCollectionView.dataSource = self
           homeCollectionView.delegate = self
         
           
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //homeCollectionView.delegate = self
        //homeCollectionView.dataSource = self
    }

}

extension HomeTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageAlita.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCollectionViewCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionCell", for: indexPath) as! HomeCollectionViewCell
        
        cell.img.image =  imageAlita[indexPath.row]
        return cell
    }
}

